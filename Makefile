.PHONY: make_bin_executable

make_bin_executable: copy_config_files
	@chmod +x ~/.config/bin/*

copy_config_files: create_config_dirs
	# iterate over all files in config and copy them to ~/.config
	@cd config && find . -type f | xargs -I {} cp -rf {} ~/.config/{}

create_config_dirs: install_packages
	# iterate over all subdirectories in config and create them if they don't exist in ~/.config
	@cd config && find . -type d | xargs -I {} mkdir -p ~/.config/{}

install_packages:
	@pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))


save:
	@pacman -Qqe > pkglist.txt
	@pacman -Qqem > foreignpkglist.txt
