#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Keyboard Layout
internal_keyboard=$(xinput | grep "AT Translated Set 2 keyboard" | sed 's/.*id=\([[:digit:]]\+\).*/\1/')
external_keyboard=$(xinput | grep "MX Keys Mini Keyboard" | sed 's/.*id=\([[:digit:]]\+\).*/\1/' | sed -n '2p')
test -f ~/.dotfiles/keyboard_layouts/Programming_Colemak_broken_n.xkb && xkbcomp -i $internal_keyboard ~/.dotfiles/keyboard_layouts/Programming_Colemak_broken_n.xkb $DISPLAY
if [[ $external_keyboard != "" && -f ~/.dotfiles/keyboard_layouts/Programming_Colemak.xkb ]]
then
    xkbcomp -i $external_keyboard ~/.dotfiles/keyboard_layouts/Programming_Colemak.xkb $DISPLAY
fi

DEFAULT_SESSION=xmonad

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

get_session(){
    local dbus_args=()
    case $1 in
        awesome) dbus_args+=(awesome) ;;
        bspwm) dbus_args+=(bspwm-session) ;;
        budgie) dbus_args+=(budgie-desktop) ;;
        cinnamon) dbus_args+=(cinnamon-session) ;;
        deepin) dbus_args+=(startdde) ;;
        enlightenment) dbus_args+=(enlightenment_start) ;;
        fluxbox) dbus_args+=(startfluxbox) ;;
        gnome) dbus_args+=(gnome-session) ;;
        i3|i3wm) dbus_args+=(i3 --shmlog-size 0) ;;
        jwm) dbus_args+=(jwm) ;;
        kde) dbus_args+=(startplasma-x11) ;;
        lxde) dbus_args+=(startlxde) ;;
        lxqt) dbus_args+=(lxqt-session) ;;
        mate) dbus_args+=(mate-session) ;;
        xfce) dbus_args+=(xfce4-session) ;;
        openbox) dbus_args+=(openbox-session) ;;
        xmonad) dbus_args+=(xmonad) ;;
        *) dbus_args+=($DEFAULT_SESSION);;
    esac

    echo "dbus-launch ${dbus_args[*]}"
}

exec $(get_session "$1")
#exec xmonad

# Set up an icon tray
trayer --edge top --aling right --SetDockType true --SetPartialStrut true \
    --expand true --width 10 --transparent true --tint 0x5f5f5f --height 18 &

# Set the default X cursor to the usual pointer
xsetroot -cursor_name left_ptr

# Fire up screensaver
xscreensaver -no-splash &

# Background Picture
nitrogen --restore &

# Make Snaps work
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

# gcalcli reminders
[[ -x /usr/bin/dunst ]] && /usr/bin/dunst -config ~/.dunstrc &

if [ -x /usr/bin/gcalcli ]; then
    while true; do
        /usr/bin/gcalcli --calendar="Flexible" remind 0
        /usr/bin/gcalcli --calendar="Elliot Swaim" remind 10
        sleep 300
    done &
fi

exec xmonad
