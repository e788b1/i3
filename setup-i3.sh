#!/bin/bash
cd
for file in `ls .i3/skel/*`
do
	ln -sfv $file '.'`basename $file`
done

mkdir -pv ~/.config/gtk-3.0
#ln -fv ${PWD}/.i3/gtk-3.0-settings ~/.config/gtk-3.0/settings.ini
#cp -vf .i3/gtk-3.0-settings .config/gtk-3.0/settings.ini
#cp -vf .i3/Trolltech.conf .config/Trolltech.conf
rm -rfv .thumbnails
ln -sv /tmp/thumbnails .thumbnails
[ ! -d .icons ] && ln -sv .i3/icons .icons
[ ! -d .vim ] && ln -sv .i3/vim .vim
ln -sv .i3/vim/vimrc .vimrc

cp -v .i3/fonts.conf .config/fontconfig/fonts.conf
# ln -v ${PWD}/.i3/fonts.conf .config/fontconfig/fonts.conf
# [ ! -d .fonts ] && ln -sv .i3/fonts .fonts
# cd .fonts
# mkfontdir
# mkfontscale
# fc-cache -fv
# cd
