if [[ "$1" == "--get" ]]; then
	echo $(($(blight get brightness) * 100 / 255))
elif [[ "$1" == "--up" ]]; then
	blight set +5%
elif [[ "$1" == "--down" ]]; then
	blight set -5%
else
    echo 󱎖 $((($(blight get brightness) + 1) * 100 / 255))
fi
