#! /bin/bash

mkdir .tmp
for css in $(ls themes/*.css); do
  theme=`echo $css | sed -e 's/themes\///' | sed -e 's/\.css$//'`
  echo $theme

  cat ./index.md | sed -e "s/_THEME_/$theme/g" > .tmp/$theme.md
  marp .tmp/$theme.md --allow-local-files --theme-set themes --output docs/$theme.html
done

rm -rf .tmp
