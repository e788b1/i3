#!/bin/bash
cd
for file in `ls .i3/skel/*`
do
	ln -sfv $file '.'`basename $file`
done

mkdir .config/

cp -v .i3/Trolltech.conf .config/Trolltech.conf

rm -rv .thumbnails
ln -sv /tmp/thumbnails .thumbnails
[ ! -d .icons ] && ln -sv .i3/icons .icons
[ ! -d .vim ] && ln -sv .i3/vim .vim
ln -sfv .i3/vim/vimrc .vimrc

[ ! -d .bash_completion.d ] && cp -rv .i3/bash_completion.d .bash_completion.d

mkdir -v .config/fontconfig
cp -v .i3/fonts.conf .config/fontconfig/fonts.conf
# ln -v ${PWD}/.i3/fonts.conf .config/fontconfig/fonts.conf
# [ ! -d .fonts ] && ln -sv .i3/fonts .fonts
# cd .fonts
# mkfontdir
# mkfontscale
# fc-cache -fv
# cd
