### Loading Performance Tool
# zmodload zsh/zprof
#
# timezsh() {
#   shell=${1-$SHELL}
#   for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
# }

# Export Oh my zsh
export ZSH="$HOME/.oh-my-zsh"

### Sets Neovim as default editor
export EDITOR="nvim"


### ALIAS Settings
if [[ -f ~/.alias ]]; then
    source ~/.alias
fi

### New NVM 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### nvm lazy mode
zstyle ':omz:plugins:nvm' lazy yes

### PLUGINS
plugins=(
    nvm
    zsh-autosuggestions
    zsh-vi-mode
    zsh-syntax-highlighting
    z 
)

### SOURCING OH MY ZSH
if [[ -f ~/.oh-my-zsh/oh-my-zsh.sh ]]; then
    export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
    source ~/.oh-my-zsh/oh-my-zsh.sh
fi

### ZSH-AUTOSUGGESTIONS settings
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # bindkey '^ ' autosuggest-accept # accept suggestion with ctrl+space
  bindkey '^H' backward-kill-word
fi

### Suggestions colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6c6c6c,bold,underline"

### Accept suggestion with ctrl+space
bindkey '^ ' autosuggest-accept 

### Makes autosuggest-accept and zsh-vi-mode compatible. Source: https://github.com/jeffreytse/zsh-vi-mode/issues/57#issuecomment-799364881
function zvm_after_init() {
    zvm_bindkey viins '^@' autosuggest-accept
}

### FZF settings
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

### VI-MODE Settings
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK

### NVIM Color Settings
COLORTERM="truecolor"

### Making firma's scripts available system-wide 
export PATH="$HOME/.cargo/bin:$PATH"

### Add my local scripts folder to PATH
export PATH="$HOME/Code/scripts/shell:$PATH"

### Pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

### Broot settings
source $HOME/.config/broot/launcher/bash/br

### set/gsed PATH:
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

### Starship call
eval "$(starship init zsh)"

### KITTY env var
KITTY_CONFIG_DIRECTORY="$HOME/.config/kitty/"
