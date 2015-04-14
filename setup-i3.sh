#!/bin/bash
cd
rm -rv .thumbnails
ln -sv /tmp/thumbnails .thumbnails

for file in `ls -d ~/.i3/skel/*`
do
	if [ ! -d '.'`basename $file` ]; then
		ln -sfv $file '.'`basename $file`
	fi
done

mkdir .config/
cd .config/
for file in `ls -d ~/.i3/config.d/*`
do
	if [ ! -d `basename $file` ]; then
		ln -sfv $file `basename $file`
	fi
done
cd
