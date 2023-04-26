#!/bin/bash
if [[ -z $1 || -z $2 ]]; then
  echo "usage: ./convert_gif.sh in.mkv out.gif 320 or just ./convert_gif.sh in.mkv out.gif"
  exit 1
fi

# Select size
if [[ -z $3 ]]; then
  WIDTH=320 
else
  WIDTH=$3
fi

ffmpeg -i "$1" \
    -vf "fps=10,scale=$WIDTH:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 "$2"
