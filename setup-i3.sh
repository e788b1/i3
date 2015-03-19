#!/bin/bash
cd
for file in `ls .i3/skel/*`
do
	ln -sfv $file '.'`basename $file`
done

mkdir -pv ~/.config/gtk-3.0
#ln -fv ${PWD}/.i3/gtk-3.0-settings ~/.config/gtk-3.0/settings.ini
cp -vf .i3/gtk-3.0-settings .config/gtk-3.0/settings.ini
cp -vf .i3/Trolltech.conf .config/Trolltech.conf
rm -rfv .thumbnails
ln -sv /tmp/thumbnails .thumbnails
[ ! -d .icons ] && ln -sv ${PWD}/.i3/icons .icons
