#!/bin/bash

cd ~/.i3
files="
    /etc/portage/
    /var/lib/portage/world
"
for file in $files
do
    cp -rv $file gentoo/
done

git add .
git commit -m "update"
git push origin master
