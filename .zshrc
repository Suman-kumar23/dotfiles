
export EDITOR="nvim"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete z)


source $ZSH/oh-my-zsh.sh
source $ZSH/oh-my-zsh.sh




export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
export PATH="/Users/isuman/.config/scripts:$PATH"



#Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

alias zconf="nvim ~/.zshrc"
alias zsource='source ~/.zshrc'

alias lg="lazygit"
alias ld='lazydocker'

alias tree="eza --tree --level=2 --ignore-glob='node_modules|.git'"
alias l='ls -al'
alias ll="eza --icons --long --header --sort=name"
alias cat="bat"
alias cls="clear"
alias ff="fzf --preview 'bat --style=numbers --color=always {} | head -n 50' | xargs -r nvim"
alias nv="nvim"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias showimg="wezterm imgcat"

# tmux aliases
alias tm='tmux'
alias tmk='tmux kill-ses -t'
alias tls='tmux ls'
alias tmw='tmux list-windows'
alias ta='tmux a'
alias tat='tmux a -t'
alias ts='tmux new'
alias tst='tmux new -s'
alias tmux='tmux'

export BLACK=0xff181819
export WHITE=0xffe2e2e3
export RED=0xfffc5d7c
export GREEN=0xff9ed072
export BLUE=0xff76cce0
export YELLOW=0xffe7c664
export ORANGE=0xfff39660
export MAGENTA=0xffb39df3
export GREY=0xff7f8490
export TRANSPARENT=0x00000000
export BG0=0xff2c2e34
export BG1=0xff363944
export BG2=0xff414550


[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval $(thefuck --alias)


function mkd(){
    mkdir -p "$@" && cd "$@"
}
