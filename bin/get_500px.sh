#!/bin/bash

html=$(curl "$1")

wallpaper=$(echo $html | grep -Po 'img .*? class="the_photo" .*? src="(.*?)"' | sed 's/.*src=//g' | sed 's/"//g')
echo $wallpaper

name=$(echo $html | grep -Po 'meta content="(.*?)" property="og:title' | sed 's/.*meta content="//g' | sed 's/" property="og:title//g')
echo $name

# <meta content="author: Noriko Tabuchi; title: Christmas Eve; category: Nature" name="description">
author=$(echo $html | grep -Po 'meta content="author: (.*?); ' | sed 's/meta content="author: //g' | sed 's/;//g' )
echo $author

# <a href="https://500px.com/white-roots" class="user_profile_link">Noriko Tabuchi</a>
profile=$(echo $html | grep -Po 'a href="(.*?)" class="user_profile_link"' | sed 's/a href="//g' | sed 's/" class="user_profile_link"//g' )
echo $profile

license="500px License"

dirname="500px - $author - $name"

if [ ! -d "$dirname" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  mkdir "$dirname"
  cd "$dirname"
  wget "$wallpaper" -O "temp.jpg"

  touch "metadata.desktop"
  echo "[Desktop Entry]" > metadata.desktop
  echo "Name=$name" >> metadata.desktop
  echo "" >> metadata.desktop
  echo "X-KDE-PluginInfo-Name=$name" >> metadata.desktop
  echo "X-KDE-PluginInfo-Author=$author" >> metadata.desktop
  echo "X-KDE-PluginInfo-Email=$profile" >> metadata.desktop
  echo "X-KDE-PluginInfo-License=$license" >> metadata.desktop

  mkdir "contents"
  cd "contents"

  mv ../temp.jpg .
  convert -resize 400 temp.jpg screenshot.png

  mkdir "images"
  cd "images"

  mv ../temp.jpg .
  newname=$(identify -format "%wx%h" "temp.jpg")
  mv "temp.jpg" "$newname.jpg"
fi
