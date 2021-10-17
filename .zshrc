# Pywal configs
(cat ~/.cache/wal/sequences &)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=9,bold,underline"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme ]]; then
    source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source /usr/share/nvm/init-nvm.sh
fi

export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim" # Sets Neovim as default editor

# . ~/.alias
if [[ -f ~/.alias ]]; then
    source ~/.alias
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="spaceship"

plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-vi-mode
)

if [[ -f ~/.oh-my-zsh/oh-my-zsh.sh ]]; then
    source ~/.oh-my-zsh/oh-my-zsh.sh
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PYENV settings
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1


# zsh-autosuggestions settings
bindkey '^ ' autosuggest-accept # accept suggestion with ctrl+space
bindkey '^H' backward-kill-word

# Makes autosuggest-accept and zsh-vi-mode compatible. Source: https://github.com/jeffreytse/zsh-vi-mode/issues/57#issuecomment-799364881
function zvm_after_init() {
    zvm_bindkey viins '^@' autosuggest-accept
}

# FZF settings
#source /usr/share/doc/fzf/examples/key-bindings.zsh
#source /usr/share/doc/fzf/examples/completion.zsh;

if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

export BAT_THEME="onedark"

# Vi-Mode Settings
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
