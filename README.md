1. Create a backup of your local neovim config repository.

	(Windows: "$env:LOCALAPPDATA/nvim")


2. Remove the current nvim config directory.


3. Clone this directory into the nvim directory:

	`git clone https://github.com/d-meyer99/neovim-config.git $env:LOCALAPPDATA/nvim`


4. Install packer as outlined here:

	https://github.com/wbthomason/packer.nvim#custom-initialization

5. Enter NeoVim and run :PackerCompile and :PackerInstall
