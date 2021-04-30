# turn keyboard-bell off xterm
xset r rate 250 80
xset b off
unclutter &
# exec --no-startup-id dockd --daemon
exec awesome
