#!/bin/sh
QUTEBROWSER_DEFAULT_CONFIG="/home/${USER}/.config/qutebrowser/config.default.py"
QUTEBROWSER_CONFIG="/home/${USER}/.config/qutebrowser/config.py"

#cat $QUTEBROWSER_DEFAULT_CONFIG
#cat $QUTEBROWSER_CONFIG

sed "/#/d; /^$/d" $QUTEBROWSER_DEFAULT_CONFIG > $QUTEBROWSER_CONFIG
