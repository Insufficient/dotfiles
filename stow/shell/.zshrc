# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ ! -f "${HOME}/.zgenom/zgenom.zsh" ]]; then
  git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
fi
source "${HOME}/.zgenom/zgenom.zsh"

# check for updates ever 7 days
zgenom autoupdate
	  		  
# only runs when .zgenom/sources/init.zsh doesn't exist
# use zgenom reset to delete init.zsh
if ! zgenom saved; then  
  zgenom load lukechilds/zsh-nvm
  zgenom load zsh-users/zsh-autosuggestions
  zgenom load zsh-users/zsh-syntax-highlighting

  zgenom load romkatv/powerlevel10k powerlevel10k


  zgenom load agkozak/zsh-z
  # zgenom load marlonrichert/zsh-autocomplete

  zgenom load ${HOME}/.zsh/iterm2_shell_integration.zsh
  zgenom save
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(mcfly init zsh)"

bindkey '\e[H'    beginning-of-line
bindkey '\e[F'    end-of-line


