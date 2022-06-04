if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Lunarvim path
set PATH /home/gui/.local/bin $PATH

# Solarfish configs (omf prompt)
# Display a shortened directory path
set -g theme_short_path no

# Disable the git indicator
set -g theme_no_git_indicator no

# Starship (prompt) activation
starship init fish | source

# Rbenv settings
status --is-interactive; and source (rbenv init -|psub)
set PATH /home/gui/.local/share/gem/ruby/3.0.0/bin $PATH

# Rust settings
set PATH /home/gui/.cargo/bin $PATH
