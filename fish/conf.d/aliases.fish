### GENERAL
alias li='ls -l'
alias -s md=typora  # Markdown files
alias ld="ls -ld */"   # List in long format, only directories
alias weather='curl http://wttr.in/'
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias please='sudo'
alias dedoff='shutdown now'
# alias rm='rm -I'
# alias htop='vtop'

### GIT
alias g='git'
alias st='status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gitl="git log --graph --pretty=format:'%C(yellow)%h%Creset -%C(red)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gc='git commit -v'
alias diffcom='git diff HEAD~1'
alias ga='git add'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'
alias glogone='git log --oneline'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glog='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gp='git push'
alias gpom='git push origin main'
alias gpoma='git push origin master'
alias grmc='git rm --cached'
alias gst='git status'
alias sttt='status'
alias clean='git-lfs clean -- %f'
alias smudge='git-lfs smudge -- %f'
alias process='git-lfs filter-process'
alias required='true'

### MOVEMENT
alias gotovimcolors='cd /usr/share/vim/vim*/colors'
alias gtvimcolors='cd /usr/share/vim/vim*/colors'
alias startomega='z omega && nvm use lts/erbium && npm run hmg'
alias gotoomega='z omega && nvm use lts/gallium && lvim'

alias gotopoly='cd ~/.dotfiles/polybar && vim config.ini'
alias gtpoly='cd ~/.dotfiles/polybar && vim config.ini'

alias gotouserchrome='cd $HOME/Library/Application\ Support/Firefox/Profiles/h7l6bngt.default-release/chrome'
alias gtuserchrome='cd $HOME/Library/Application\ Support/Firefox/Profiles/h7l6bngt.default-release/chrome'

### REPLACEMENT 
alias vim='nvim'
function xevv
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
end

alias pacautoremove='pacman -Qdtq | sudo pacman -Rs -'
alias pbcopy='xclip -selection clipboard'
alias cpbranch='git branch --show-current | pbcopy'
alias js='node'

### PYTHON aliases:
alias pipi='pip install --upgrade pip && pip install -r requirements.txt && pip freeze — local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U && pip freeze > requirements.txt && git add requirements.txt && git commit -m "Atualiza pacotes" && git push'
alias pip='pip3'

### RUBY aliases
alias beijos='bundle exec jekyll serve'

### macOS aliases
alias flushdnsmac='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
