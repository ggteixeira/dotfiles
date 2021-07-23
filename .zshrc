if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

source /usr/share/nvm/init-nvm.sh
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim" # Sets Neovim as default editor

# . ~/.alias
source ~/.alias

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vi-mode
)

source ~/.oh-my-zsh/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PYENV settings
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)" 


# zsh-autosuggestions settings
bindkey '^ ' autosuggest-accept # accept suggestion with ctrl+space
bindkey '^H' backward-kill-word

# FZF settings
#source /usr/share/doc/fzf/examples/key-bindings.zsh
#source /usr/share/doc/fzf/examples/completion.zsh;

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

export BAT_THEME="onedark"

# Pywal configs
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
# (cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=9,bold,underline"

# Vi-Mode Settings
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
