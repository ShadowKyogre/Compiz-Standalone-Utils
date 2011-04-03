# This shell script is run before Compiz launches.
# Environment variables set here are passed to the Compiz session.

# Set a background color
BG=""
if which hsetroot >/dev/null 2>&1; then
    BG=hsetroot
else
    if which esetroot >/dev/null 2>&1; then
	BG=esetroot
    else
	if which xsetroot >/dev/null 2>&1; then
	    BG=xsetroot
	fi
    fi
fi
test -z $BG || $BG -solid "#202020"

# D-bus
if which dbus-launch >/dev/null 2>&1 && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval `dbus-launch --sh-syntax --exit-with-session`
fi

# Run XDG autostart things.  By default don't run anything desktop-specific
# See xdg-autostart --help more info
DESKTOP_ENV="COMPIZ"
if which /usr/bin/xdg-autostart >/dev/null 2>&1; then
  /usr/bin/xdg-autostart $DESKTOP_ENV
fi
