#!/bin/sh
#             _       _ _
#       __  _(_)_ __ (_) |_ _ __ ___
#       \ \/ / | '_ \| | __| '__/ __|
#        >  <| | | | | | |_| | | (__
#       /_/\_\_|_| |_|_|\__|_|  \___|


userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

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

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

emacs --daemon &
# cursor
xsetroot -cursor_name left_ptr

feh --bg-fill Pictures/climb.jpeg &
# wal --backend colorthief -i Pictures/shryne.gif -n -o scripts/reload_dunst.sh &
xrdb -load .Xresources
$HOME/.local/bin/arbtt-capture &
export GTK_IM_MODULE=xim

exec $HOME/.local/share/xmonad/xmonad-x86_64-linux
