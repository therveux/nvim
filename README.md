# My neovim configuration

Just an useless git repository to keep my nvim configuration. 

## Getting Started

You can follow this tutorial to get neovim - [Tutorial](https://www.linode.com/docs/tools-reference/how-to-install-neovim-and-plugins-with-vim-plug)
Or this one - [Tutorial-PPA](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-package)

## Installation

Follow the instructions related to your distrib in order to have Neovim package

Be careful about dependencies especially for Python

*For the plugins part*

You have to create a directory to store Nvim configuration file (init.vim)

```bash
$ mkdir -p ~/.config/nvim
```

Install the Vim-plug Plugin Manager

```bash
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install the NeoVim Python module

```bash
$ pip3 install --user neovim
```

Create the Nvim configuration if it's not done yet

```bash
$ touch ~/.config/nvim/init.vim
```

Add the following lines 

	call plug#begin()
	Plug 'roxma/nvim-completion-manager'
	call plug#end()

Launch nvim, excute PlugInstall, update the plugins and exit

	nvim
	:PlugInstall
	:UpdateRemotePlugins
	:qa!

## Optionnal

If you want to use Neovim for some (or all) of the editor alternatives, use the following commands:

	sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
	sudo update-alternatives --config vi
	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
	sudo update-alternatives --config vim
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
	sudo update-alternatives --config editor

## Authors

* **Théo Herveux** - *Initial work* - [MyGit](https://github.com/Hurobaki)
