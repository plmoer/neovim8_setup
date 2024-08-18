Author: plmoer@gmail.com
Date: Nov. 6, 2022

OS: Ubuntu 20.04 / Mac OS 12.0
Neovim (version 0.8)
Git Reference: https://github.com/LunarVim/Neovim-from-scratch
Video Reference: https://www.youtube.com/watch?v=vdn_pKJUda8


-------- Update system -----------------
        sudo add-apt-repository ppa:neovim-ppa/stable
        sudo apt-get update
        sudo apt install build-essential

-------- Neovim Setup -----------------
Step 1: Install Neovim (version >=0.8)
        Official website: https://neovim.io/
      options:
      a. For Ubuntu 20.04
        sudo apt-get install neovim

      b. For Mac OS 12.0
        brew install neovim

Step 2: Configure the neovim. Put the folder of "nvim" under the directory of $HOME/.config/
      Install plugins by type command of ":PackerInstall" in a opening vim file

Step 3: Install Hack Nerd Font. Download the Hack Nerd Font from the repository
      a. For Ubuntu 20.04
      Put all fonts under the directory of "$HOME/.fonts". 
      Change system font: open the "Preference" of any Terminal, manually change the Hack Nerd Font under the Text Tab.

      b. For Mac OS 12.0
      Put all fonts under the directory of $HOME/Library/Fonts", 
      Then activate the Nerd Font through Terminal Preference setting

Step 4: In a command mode of the "init.lua" file, type command of "PackerSync", and thentype ":Manson"
      Under the Mason setting up page, type "i" to install a language server
      To format a Python file, need to install "autopep8" under the Formatter in the Mason GUI
      or type "X" (captial x) to delete a selected language server
      Note: you can custermize the language server through the Manson GUI.

      Suggestion: 
      a, Run :Mason in a vim, and reinstall pyright, autopep8, or other language libraries
      b, Run :checkhealther in a vim 


-------- ZSH sett up -----------------
1. put the folder of zsh into ~/.config/
2. change the zshrc file to .zshrc, and put the file under the root folder
3. change from bash to zsh:  chsh -s /bin/zsh <userName>, make sure the zsh installed.
