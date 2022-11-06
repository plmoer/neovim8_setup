Author: plmoer@gmail.com
Date: Nov. 6, 2022

OS: Ubuntu 20.04 / Mac OS 12.0
Neovim (version 0.8)
Git Reference: https://github.com/LunarVim/Neovim-from-scratch
Video Reference: https://www.youtube.com/watch?v=vdn_pKJUda8

-------- Neovim Setup -----------------
Step 1: Install Neovim (version >=0.8)
      a. For Ubuntu 20.04
        sudo add-apt-repository ppa:neovim-ppa/stable
        sudo apt-get update
        sudo apt-get install neovim
        sudo apt install build-essential

      b. For Mac OS 12.0
        brew install neovim

Step 2: Configure the neovim. Put the folder of "nvim" under the directory of $HOME/.config/
      Install plugins by type command of ":PackerInstall" in a opening vim file

Step 3: Install Hack Nerd Font. Download the Hack Nerd Font from the repository
      a. For Ubuntu 20.04
      Put all fonts under the directory of "$HOME/.local/share/fonts". 
      Change system font: open the "Preference" of any Terminal, manually change the Hack Nerd Font under the Text Tab.

      b. For Mac OS 12.0
      Put all fonts under the directory of $HOME/Library/Fonts", 
      Then activate the Nerd Font through Terminal Preference setting

Step 4: In a command mode of the "init.lua" file, type command of "PackerSync", and thentype ":Manson"
      Under the Mason setting up page, type "i" to install a language server
      To format a Python file, need to install "autopep8" under the Formatter in the Mason GUI
      or type "X" (captial x) to delete a selected language server
      Note: you can custermize the language server through the Manson GUI.

Step 5: Trouble shooting of "TreeSitter" plugin, if there is any error associated with "TreeSitter"
      a. Type ":TSUpdate" to solve issue
      b. Or comment the "TreeSitter" in the "$HOME/.config/nvim/init.lua"
