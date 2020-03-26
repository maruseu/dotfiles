#!/bin/sh
rm -f /tmp/clip.png ; maim -s /tmp/clip.png -u ; xclip -selection clipboard -t image/png -i /tmp/clip.png
