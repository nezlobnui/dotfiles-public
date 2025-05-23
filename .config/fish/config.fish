# Убираем приветствие Fish
set fish_greeting ""

# Настройка терминала
set -gx TERM xterm-ghostty

# 🖌️ Тема оформления
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# ⚡ Алиасы
alias la tree
alias cl clear
alias g git
alias c claude
alias v nvim

# Dirs
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias ...... "cd ../../../../.."

# Docker
alias dco "docker compose"
alias dps "docker ps"
alias dpa "docker ps -a"
alias dl "docker ps -l -q"
alias dx "docker exec -it"

# 📝 Редактор по умолчанию
set -gx EDITOR nvim

# 🔗 Пути
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/sbin $PATH

# 🌐 NodeJS
set -gx PATH node_modules/.bin $PATH

# 🔹 Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# 🖥️ Проверяем наличие eza (расширенная версия ls)
if type -q eza
    alias l "eza -l --icons --git -a"
    alias lt "eza --tree --level=2 --long --icons --git"
    alias ltree "eza --tree --level=2 --icons --git"
end

# 🔍 Fzf
set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0

# 🔎 Автодополнение для Go
if type -q go
    # Общие команды
    complete -c go -f -a "build run test mod clean fmt vet doc install get list version env generate"

    # Автодополнение для go run: список всех .go файлов в текущей директории
    complete -c go -n '__fish_seen_subcommand_from run' -f -a "(ls *.go | string split '\n')"

    # Автодополнение для go test: список всех пакетов
    complete -c go -n '__fish_seen_subcommand_from test' -f -a "(go list ./... | string split '\n')"

    # Автодополнение для go generate: список всех пакетов
    complete -c go -n '__fish_seen_subcommand_from generate' -f -a "(go list ./... | string split '\n')"

    # Автодополнение для go install: список всех пакетов
    complete -c go -n '__fish_seen_subcommand_from install' -f -a "(go list ./... | string split '\n')"
end

eval "$(/opt/homebrew/bin/brew shellenv)"
