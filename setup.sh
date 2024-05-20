#!bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

for d in config/*; do
    {pritf $d; printf $d | awk -F "/" '{print "/.config/"$2}'; } | tr "\n" " " # | xargs mkdir -p
    for f in $d/*; do
        echo "Installing ${f:7}"
        # ln -sf $SCRIPT_DIR/$f ~/.config/${f:7}
    done
    # ln $f ~/.config/$f
done