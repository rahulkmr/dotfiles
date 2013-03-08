#!/bin/sh
# Set the links for the config files.
for file in \.*; do
    if [ $(basename $file) != ".git" ] && [ $(basename $file) != "." ] && [ $(basename $file) != ".." ]; then
        ln -is `pwd`/$file ~
    fi
done

