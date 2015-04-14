#!/bin/bash

url=`xclip -o`
[[ 'https://500px.com' != `echo $url | cut -d '/' -f1-3` ]] &&
    notify-send "Copied URL invalid!" && exit 1
notify-send "500px is Fetching ..."
html=$(curl $url)
source=$(echo $html | grep -Po 'img .*? class="the_photo" .*? src="(.*?)"' | sed 's/.*src=//g' | sed 's/"//g')
name=$(echo $html | grep -Po 'meta content="(.*?)" property="og:title' | sed 's/.*meta content="//g' | sed 's/" property="og:title//g')
author=$(echo $html | grep -Po 'meta content="author: (.*?); ' | sed 's/meta content="author: //g' | sed 's/;//g' )

wget "$source" -O "/tmp/temp.jpg"

[[ -d ~/Pictures/500px/ ]] || mkdir -p ~/Pictures/500px/
targetfile="$HOME/Pictures/500px/$name@$author.jpg"

mv "/tmp/temp.jpg" "$targetfile"
[[ -f $targetfile ]] && notify-send "$targetfile √"
