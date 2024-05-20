make_bin_executable: copy_config_files
	@chmod +x ~/.config/bin/*

copy_config_files: create_config_dirs
	# iterate over all files in config and copy them to ~/.config
	@cd config && find . -type f | xargs -I {} cp -rf {} ~/.config/{}

create_config_dirs:
	# iterate over all subdirectories in config and create them if they don't exist in ~/.config
	@cd config && find . -type d | xargs -I {} mkdir -p ~/.config/{}



.PHONY: make_bin_executable