

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete z)


source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.exports
source $HOME/.functions

source $ZSH/oh-my-zsh.sh




# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
