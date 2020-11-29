# $HOME/.profile

#Set our umask
umask 022

# Set our default path
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin/core_perl:/usr/bin:$HOME/.config/bspwm/panel:$HOME/.bin"
export PANEL_FIFO="/tmp/panel-fifo"
export PATH
export XDG_CONFIG_HOME="$HOME/.config"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export PANEL_HEIGHT=25
export XDG_CONFIG_DIRS=/usr/etc/xdg:/etc/xdg
export GUI_EDITOR=/usr/bin/code
export BROWSER=/usr/bin/google-chrome-stable
export TERMINAL=/usr/bin/kitty
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/code
export VISUAL=/usr/bin/code
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export WALLPAPER="$HOME/Pictures/wallpapers/tree1.jpg"

alias ll='ls -alHGt'
alias c='clear'

append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

# Append our default paths
append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/bin'


# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Unload our profile API functions
unset -f append_path

# Source global bash config
if test "$PS1" && test "$BASH" && test -r /etc/bash.bashrc; then
	. /etc/bash.bashrc
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH
