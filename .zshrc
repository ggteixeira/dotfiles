### Loading Performance Tool
# zmodload zsh/zprof

# timezsh() {
#   shell=${1-$SHELL}
#   for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
# }

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="$HOME/.oh-my-zsh"
# Sets Neovim as default editor
# export EDITOR="nvim"

# Sets Lunarvim as default editor
export EDITOR="lvim"

### ALIAS Settings
if [[ -f ~/.alias ]]; then
    source ~/.alias
fi

### THEMES
ZSH_THEME="powerlevel10k/powerlevel10k"

# ### New NVM and NVM Lazy Load settings:

export NVM_DIR="$HOME/.nvm"

# This lazy loads nvm
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
  nvm $@
}

# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Make binaries accessible:
export PATH="$NVM_DIR/versions/node/v12.14.1/bin:$PATH"

DEFAULT_NODE_VER='$((cat "$NVM_DIR/alias/default" || cat ~/.nvmrc) 2> /dev/null)'

# This resolves the path to the default node version
DEFAULT_NODE_VER_PATH="$(find $NVM_DIR/versions/node -maxdepth 1 -name "v${DEFAULT_NODE_VER#v}*" | sort -rV | head -n 1)"


### PLUGINS
plugins=(
    nvm
    zsh-autosuggestions
    zsh-vi-mode
    zsh-syntax-highlighting
)

### SOURCING OH MY ZSH
if [[ -f ~/.oh-my-zsh/oh-my-zsh.sh ]]; then
    source ~/.oh-my-zsh/oh-my-zsh.sh
fi

### SOURCING POWERLEVEL10K
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

export BAT_THEME="onedark"

### VI-MODE Settings
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK


### NVIM Color Settings
COLORTERM="truecolor"

### Lunarvim Settings
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

### Making firma's scripts available system-wide 
export PATH="$HOME/.cargo/bin:$PATH"

# z
. /opt/homebrew/etc/profile.d/z.sh
