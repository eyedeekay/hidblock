#! /bin/sh

echo -e "This script create a user-level bin directory at \$HOME/.bin and adds\n
it to your path in your \$HOME/.profile. Then it makes a symbolic link
"

NEWBIN="$HOME/.bin"
PROFILERC="# set PATH so it includes user's private bin if it exists\n
if [ -d \"\$HOME/.bin\" ] ; then\n
\t	export PATH=\"\$HOME/.bin:\$PATH\"\n
fi\n"
THISDIR=pwd 

if [ "$NEWBIN" -d ]; then
	if [ "$NEWBIN/hidblock" -e]; then
		ln -s  "$THISDIR/hidblock" "$NEWBIN/hidblock"
	fi
else
	mkdir -p $NEWBIN
		if [ "$NEWBIN/hidblock" -e]; then
			ln -s  "$THISDIR/hidblock" "$NEWBIN/hidblock"
		fi
	echo -e "$PROFILERC" >> "$HOME/.profile"
fi