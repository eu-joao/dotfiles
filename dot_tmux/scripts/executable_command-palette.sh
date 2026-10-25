#!/usr/bin/env bash
# ┌────────────────────────────────────────────────────────────────────────────┐
# │ ~/.tmux/scripts/command-palette.sh                                         │
# └────────────────────────────────────────────────────────────────────────────┘
# Palette filtrável (fzf) com estética herdr: cores vêm dos @herdr-* do tema
# ativo. Lista: ~/.tmux/palette.tsv
#
# Fundo = crust (mesmo do terminal/painéis). Atalhos em overlay1 via ANSI só de
# foreground (\033[39m no fim — nunca \033[0m, que reseta o fundo e racha a
# linha). --color do fzf é o "tema" da palette; FZF_DEFAULT_OPTS é zerado aqui.

set -euo pipefail

PALETTE="${HOME}/.tmux/palette.tsv"
export FZF_DEFAULT_OPTS=""

# ── Cores do tema herdr ───────────────────────────────────────────────────────
herdr() {
  tmux show-options -gv "@herdr-$1" 2>/dev/null || printf '%s' "$2"
}

CRUST=$(herdr crust "#11111b")
SURFACE0=$(herdr surface0 "#313244")
SURFACE1=$(herdr surface1 "#45475a")
OVERLAY0=$(herdr overlay0 "#6c7086")
OVERLAY1=$(herdr overlay1 "#7f849c")
TEXT=$(herdr text "#cdd6f4")
MAUVE=$(herdr mauve "#cba6f7")

# Hex #rrggbb → "r;g;b" para ANSI 38;2 (só o atalho, apagado)
hex_rgb() {
  local h="${1#\#}"
  printf '%d;%d;%d' "0x${h:0:2}" "0x${h:2:2}" "0x${h:4:2}"
}

DIM=$(hex_rgb "$OVERLAY1")

# Shell dentro do popup = crust (borda e miolo iguais ao terminal)
printf '\033]11;%s\033\\' "$CRUST"
printf '\033]10;%s\033\\' "$TEXT"

# ── Monta a lista (rótulo · atalho dim · comando oculto) ──────────────────────
# Colunas: label \t key(ansi) \t cmd — fzf mostra 1 e 2
build_list() {
  local label key cmd
  while IFS=$'\t' read -r label key cmd || [[ -n "${label:-}" ]]; do
    [[ -z "${label:-}" || "$label" == \#* ]] && continue
    [[ -z "${cmd:-}" ]] && continue
    printf '%s\t\033[38;2;%sm%s\033[39m\t%s\n' "$label" "$DIM" "$key" "$cmd"
  done < "$PALETTE"
}

if [[ ! -f "$PALETTE" ]]; then
  tmux display-message "palette.tsv não encontrado em ~/.tmux/"
  exit 1
fi

selected="$(
  build_list | fzf \
    --ansi \
    --delimiter=$'\t' \
    --with-nth=1,2 \
    --nth=1,2 \
    --tabstop=28 \
    --prompt='  ' \
    --pointer='●' \
    --marker='●' \
    --info=inline-right \
    --header=$'  ações · digite para filtrar\n' \
    --header-first \
    --no-bold \
    --cycle \
    --layout=reverse \
    --border=none \
    --padding=0,1 \
    --color="bg:${CRUST},gutter:${CRUST},preview-bg:${CRUST}" \
    --color="bg+:${SURFACE0},fg:${TEXT},fg+:${TEXT}" \
    --color="hl:${MAUVE},hl+:${MAUVE}" \
    --color="pointer:${MAUVE},marker:${MAUVE},prompt:${MAUVE}" \
    --color="header:${OVERLAY0},info:${OVERLAY0},query:${TEXT}" \
    --color="spinner:${MAUVE},border:${SURFACE1}" \
    --bind='esc:abort' \
    --height=100%
)" || exit 0

[[ -z "$selected" ]] && exit 0

# 3ª coluna = comando
cmd="${selected##*$'\t'}"
path="$(tmux display-message -p '#{pane_current_path}')"
path_q="$(printf '%q' "$path")"
cmd="${cmd//\{path\}/$path_q}"

# Comando confiado (arquivo do próprio usuário)
eval "tmux $cmd"
