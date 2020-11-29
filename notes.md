### change screensize
`xrandr -s 3440x1440`

### keyboard layout for TTY
sudo cp workman.map.gz /usr/share/kbd/keymaps/
sudo cp vconsole.conf /etc/vconsole.conf
#add to .xinitrc
setxkbmap -layout us -variant workman 
localectl set-x11-keymap us 104 workman

### refresh rate

```
cp xorg.conf /etc/X11/mhwd.d/nvidia.conf
```


### fix append_path issue in zsh load
add to ~/.profile

```
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
```

### add to .Xmodmap

```
remove Lock = Caps_Lock
keycode 0x42 = Control_L
add Control = Control_L
```
