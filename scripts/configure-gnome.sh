#!/bin/bash
    #configure dock to be on the bottom
    gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
    #configure buttons
    gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
	#configure keymap swap
    gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
    #configure keymap swap
	gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
    #remove autosuspend
   	#gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
    #remove autosuspend
   	#gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
    #remove current screenshot button
    gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot '[]'
    #configure favourites
    dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'org.gnome.Terminal.desktop', 'linphone.desktop', 'flameshot.desktop']"
    #configure bulgarian keymapping && us maps
    gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'bg+phonetic')]"
    #configure flameshot screenshot tool
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'flameshot'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/flameshot gui'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding 'Print'
