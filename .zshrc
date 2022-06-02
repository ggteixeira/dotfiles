### Loading Performance Tool
# zmodload zsh/zprof

# timezsh() {
#   shell=${1-$SHELL}
#   for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
# }

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### POWERLEVEL10K Settings
if [[ -f ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme ]]; then
    source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
fi

export ZSH="$HOME/.oh-my-zsh"
# Sets Neovim as default editor
export EDITOR="nvim"

### ALIAS Settings
if [[ -f ~/.alias ]]; then
    source ~/.alias
fi

### THEMES
ZSH_THEME="powerlevel10k/powerlevel10k"

### NVM and PYWAL Settings (Linux-exclusive settings)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source /usr/share/nvm/init-nvm.sh  # NVM

    (cat ~/.cache/wal/sequences &)  # PYWAL
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=9,bold,underline"  # PYWAL
fi

## NVM Lazy Loading Settings
export NVM_LAZY=1
# export NVM_LAZY_LOAD=true
# export NVM_COMPLETION=true
# export PATH="/usr/local/sbin:$PATH"

### PLUGINS
plugins=(
    nvm
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-vi-mode
)

### SOURCING OH MY ZSH
if [[ -f ~/.oh-my-zsh/oh-my-zsh.sh ]]; then
    source ~/.oh-my-zsh/oh-my-zsh.sh
fi

### SOURCING POWERLEVEL10K
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### PYENV settings
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv virtualenv-init -)"
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"    # if `pyenv` is not already on PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# eval "$(pyenv init --path)"

### ZSH-AUTOSUGGESTIONS settings
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # bindkey '^ ' autosuggest-accept # accept suggestion with ctrl+space
  bindkey '^H' backward-kill-word
fi

bindkey '^ ' autosuggest-accept # accept suggestion with ctrl+space

## Makes autosuggest-accept and zsh-vi-mode compatible. Source: https://github.com/jeffreytse/zsh-vi-mode/issues/57#issuecomment-799364881
function zvm_after_init() {
    zvm_bindkey viins '^@' autosuggest-accept
}

### FZF settings
#source /usr/share/doc/fzf/examples/key-bindings.zsh
#source /usr/share/doc/fzf/examples/completion.zsh;

if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

export BAT_THEME="onedark"

### VI-MODE Settings
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK

### RUBY settings
# export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
# export PATH="$PATH:$GEM_HOME/bin"
export PATH="/usr/local/sbin:$PATH"
export GEM_HOME="$HOME/.gem"
eval "$(rbenv init - zsh)"

### NVIM Color Settings
COLORTERM="truecolor"

### Lunarvim Settings
export PATH="$HOME/.local/bin:$PATH"
