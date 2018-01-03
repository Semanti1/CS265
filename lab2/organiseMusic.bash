i#!/bin/bash

# Set field separator to dash
IFS=-

# Loop over mp3 files
for song in *.mp3; do

    # Read long name into dash separated array
    read -a songinfo <<< "$song"

    # Remove trailing space from band name
    band=${songinfo[0]% }

    # Remove trailing and leading space from album name
    album=${songinfo[1]% }
    album=${album# }

    # Remove leading space from song title
    title=${songinfo[2]# }

    # Make band/album directory, don't complain if they exist already
    mkdir --parents "$band/$album"

    # Move and rename song
    mv "$song" "$band/$album/$title"
done
