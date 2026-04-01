# Export Oh my zsh
export ZSH="$HOME/.oh-my-zsh"

### Sets Neovim as default editor
export EDITOR="nvim"


### ALIAS Settings
if [[ -f ~/.alias ]]; then
    source ~/.alias
fi



### makes completion case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

### PLUGINS
plugins=(
    zsh-autosuggestions
    zsh-vi-mode
    zsh-syntax-highlighting
    asdf
)

### SOURCING OH MY ZSH
if [[ -f ~/.oh-my-zsh/oh-my-zsh.sh ]]; then
    export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
    source ~/.oh-my-zsh/oh-my-zsh.sh
fi

### Accept suggestion with ctrl+space
bindkey '^ ' autosuggest-accept 

### Makes autosuggest-accept and zsh-vi-mode compatible. Source: https://github.com/jeffreytse/zsh-vi-mode/issues/57#issuecomment-799364881
function zvm_after_init() {
    zvm_bindkey viins '^@' autosuggest-accept
}

### FZF settings
[[ -f ~/.fzf.zsh ]] || fzf --zsh > ~/.fzf.zsh
source ~/.fzf.zsh

if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

### VI-MODE Settings
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK

### NVIM Color Settings
export COLORTERM="truecolor"

export PATH=$HOME/.local/bin:$PATH

### Rust / Cargo
export PATH="$HOME/.cargo/bin:$PATH"

### Add my local scripts folder to PATH
export PATH="$HOME/Scripts/shell:$PATH"

### Pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

pyenv() {
    unfunction pyenv
    eval "$(command pyenv init -)"
    pyenv "$@"
}

### Broot settings
br() {
    source "$HOME/.config/broot/launcher/bash/br"
    br "$@"
}

### set/gsed PATH:
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

### KITTY env var
export KITTY_CONFIG_DIRECTORY="$HOME/.config/kitty/"

### Starship call
eval "$(starship init zsh)"

# Volta
export PATH="$HOME/.volta/bin:$PATH"

# dotnet
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT/tools:$DOTNET_ROOT:$PATH"

# mysql
export PATH=$PATH:/Applications/MySQLWorkbench.app/Contents/MacOS
export PATH=$PATH:/usr/local/mysql/bin

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

#### Ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Ruby (for compilers to find ruby)
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# Ruby (for pkg-config to find ruby)
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

### Zoxide (its docs asks for it to be placed at the end of .zshrc)
eval "$(zoxide init zsh)"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
