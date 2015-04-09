#!/bin/bash

cd ~/.i3
files="
    /etc/portage/make.conf
    /etc/portage/package.use/e788b1.use
    /var/lib/portage/world
"
for file in $files
do
    cp -v $file gentoo/
done

git add .
git commit -m 'update i3 config'
git push origin master
