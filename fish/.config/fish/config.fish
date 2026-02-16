# ===============================
#   Viktor's Fish Configuration
# ===============================

# Disable default greeting
set -g fish_greeting

# -------------------------------
# Environment
# -------------------------------

# Add user paths
fish_add_path ~/.local/bin
fish_add_path ~/Applications/depot_tools

# Man page formatting (if bat exists)
if type -q bat
    set -x MANROFFOPT "-c"
    set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
end

# -------------------------------
# Aliases
# -------------------------------

if type -q eza
    alias ls="eza -a --group-directories-first --icons"  # all files
    alias ll="eza -al --group-directories-first --icons" # long format
end

# -------------------------------
# Key Bindings
# -------------------------------

fish_default_key_bindings

# -------------------------------
# History Configuration
# -------------------------------

set -g fish_history_limit 100000

# -------------------------------
# Banner Colour Function
# -------------------------------

function colorize
    for line in (cat $argv)
        set line (string replace -a "{{M}}" (set_color white) $line)
        set line (string replace -a "{{A}}" (set_color cyan) $line)
        echo $line
    end
    set_color normal
end

# -------------------------------
# Greeting
# -------------------------------

function fish_greeting
    if status is-interactive; and not set -q SSH_CONNECTION; and type -q fastfetch
        set_color --bold
        colorize ~/.config/fish/banner.txt
        fastfetch
        set_color normal
    end
end
