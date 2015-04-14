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

import -window root -display :0.0 -screen screenshots/i3.png

git add .
git commit -m "update"
git push origin master
