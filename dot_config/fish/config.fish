# ┌────────────────────────────────────────────────────────────────────────────┐
# │ ~/.config/fish/config.fish                                                 │
# └────────────────────────────────────────────────────────────────────────────┘

# ┌────────────────────────────────────────────────────────────────────────────┐
# │ Ambiente                                                                   │
# └────────────────────────────────────────────────────────────────────────────┘
set -gx LANG pt_BR.UTF-8
set -gx LC_ALL pt_BR.UTF-8
set -gx EDITOR nvim
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"   # man colorido via bat
set -g fish_greeting                                   # sem mensagem de boas-vindas ao abrir o shell

# ┌────────────────────────────────────────────────────────────────────────────┐
# │ PATH + Homebrew                                                            │
# └────────────────────────────────────────────────────────────────────────────┘
# -g mantém o PATH definido só aqui (sem gravar em fish_user_paths, que é universal)
fish_add_path -g $HOME/.local/bin

if test -x /home/linuxbrew/.linuxbrew/bin/brew
    /home/linuxbrew/.linuxbrew/bin/brew shellenv fish | source

    # completions do brew (gh, chezmoi etc.) para o fish
    for dir in completions vendor_completions.d
        if test -d $HOMEBREW_PREFIX/share/fish/$dir
            and not contains $HOMEBREW_PREFIX/share/fish/$dir $fish_complete_path
            set -p fish_complete_path $HOMEBREW_PREFIX/share/fish/$dir
        end
    end
end

# ┌────────────────────────────────────────────────────────────────────────────┐
# │ Histórico                                                                  │
# └────────────────────────────────────────────────────────────────────────────┘
# Nada a configurar: o fish já ignora duplicatas, compartilha o histórico entre
# sessões abertas e não salva comandos que começam com espaço.
# (HISTSIZE/SAVEHIST não existem; o limite do fish é de 256 mil entradas.)

# ┌────────────────────────────────────────────────────────────────────────────┐
# │ Aliases                                                                    │
# └────────────────────────────────────────────────────────────────────────────┘
if status is-interactive
    # ── Navegação ─────────────────────────────────────────────────────────────
    abbr -a .. "cd .."
    abbr -a ~ "cd ~"

    # ── Listagem (eza é o fork mantido do exa) ────────────────────────────────
    alias l="eza --classify --color=always --all --sort=type --icons"
    alias ls="eza --classify --color=always --all --sort=type --icons"
    alias lt="eza --classify --color=always --all --sort=type --tree --level=2 --icons"
    alias lg="eza --classify --color=always --all --sort=type --long --header --links --no-user --icons"

    # ── Editor ────────────────────────────────────────────────────────────────
    alias vi=nvim
    alias vim=nvim
    alias i=nvim

    # ── Ferramentas ───────────────────────────────────────────────────────────
    alias cat=bat
    alias dl=yt-dlp
    alias neofetch=fastfetch

    # ── Git ───────────────────────────────────────────────────────────────────
    alias gs="git status"
    alias gc="git commit"
    alias gl="git log"
end

# ┌────────────────────────────────────────────────────────────────────────────┐
# │ Pure (prompt)                                                              │
# └────────────────────────────────────────────────────────────────────────────┘
# Instalado pelo fisher, sem nada a carregar aqui (o fish autocarrega o prompt).
#   brew install fisher
#   fisher install pure-fish/pure

# ┌────────────────────────────────────────────────────────────────────────────┐
# │ fzf (busca fuzzy)                                                          │
# └────────────────────────────────────────────────────────────────────────────┘
# Ctrl+R → histórico | Ctrl+T → arquivos | Alt+C → diretórios
# Instalação: https://github.com/junegunn/fzf#installation (precisa da versão 0.48+)
if status is-interactive; and type -q fzf
    fzf --fish | source
end

# ┌────────────────────────────────────────────────────────────────────────────┐
# │ Plugins                                                                    │
# └────────────────────────────────────────────────────────────────────────────┘
# Sem plugins: autosuggestions (→ aceita) e syntax highlighting já são nativos do fish.
