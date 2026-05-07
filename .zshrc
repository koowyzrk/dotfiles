export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fishy"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  sudo
  # seedee
  zsh-eza
  fzf-tab
  fzf-dir-navigator
  # fzf-tab-source
  zsh-history-substring-search
  zsh-autosuggestions
  zsh-fzf-history-search
  colored-man-pages
  zsh-syntax-highlighting
)
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:commands' fzf-preview ''

source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export TERM=xterm-kitty
# export CODEX_HOME="$HOME/.codex"

export MANGOHUD_CONFIGFILE="~/.config/MangoHud/MangoHud.conf"
export JAVA_HOME="/usr/bin/jdk-25.0.2"
# export JAVA_HOME="/usr/bin/jdk-23"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet"
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/opt/cuda/bin"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# For a full list of active aliases, run `alias`.
# ranger
ranger_cd() {
    local temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    
    # Używamy 'command ranger', aby pominąć ewentualne zapętlenia aliasów
    command ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    
    if [[ -f "$temp_file" ]]; then
        local target_dir="$(cat "$temp_file")"
        if [[ -n "$target_dir" ]] && [[ "$target_dir" != "$PWD" ]]; then
            cd "$target_dir" # To wywoła hook dla zoxide!
        fi
    fi
    rm -f "$temp_file"
}
alias ranger='ranger_cd'
# 

alias killvpn="sudo kill $(pidof openvpn)"
alias godot="godot --single-window"
alias alt="$HOME/git/altserver-arch-linux/alt.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Created by `pipx` on 2025-10-30 21:02:51
export PATH="$PATH:$HOME/.local/bin"

eval "$(zoxide init zsh)"
