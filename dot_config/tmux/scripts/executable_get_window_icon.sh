#!/bin/bash

# Script para retornar o ícone com base no nome da janela ou comando
# Uso: get_window_icon.sh <window_name ou command>

command_or_name="$1"

# Converter para minúsculo para facilitar a comparação
command_or_name_lower=$(echo "$command_or_name" | tr '[:upper:]' '[:lower:]')

case "$command_or_name_lower" in
  vim|nvim|vi|emacs|code|vscode|subl|atom|gedit|kate)
    echo ""  # editores de código
    ;;
  bash|zsh|sh|fish|dash|tcsh|pwsh|powershell)
    echo ""  # terminais
    ;;
  firefox|chrome|chromium|brave|edge|opera|safari|elinks|w3m|lynx)
    echo ""  # navegadores
    ;;
  nautilus|dolphin|thunar|pcmanfm|nemo|explorer|ranger|ls|lsof)
    echo ""  # gerenciadores de arquivos
    ;;
  spotify|mpd|moc|ncmpcpp|cmus|mpv|vlc|audacious|banshee)
    echo ""  # players de música
    ;;
  feh|sxiv|gpicview|eog|imv|nomacs)
    echo ""  # visualizadores de imagens
    ;;
  mpv|vlc|smplayer|totem|xine)
    echo ""  # players de vídeo
    ;;
  evince|okular|zathura|mupdf|xpdf|acroread)
    echo ""  # visualizadores de PDF
    ;;
  thunderbird|evolution|mutt|neomutt|alpine|geary|claws)
    echo ""  # clientes de email
    ;;
  discord|telegram|signal|slack|element|pidgin)
    echo ""  # clientes de mensagens
    ;;
  mysql|psql|sqlite3|mongosh|pgcli|mycli)
    echo ""  # bancos de dados
    ;;
  tmux)
    echo ""  # terminal (default para tmux)
    ;;
  *)
    echo ""  # default: terminal
    ;;
esac
