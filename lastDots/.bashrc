#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# MPD daemon start (if no other user instance exists)
# [ ! -s ~/.config/mpd/pid ] && mpd ~/.config/mpd/mpd.conf

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
PS1='┏━\e[0;34m[\u@\h]\e[m━━[\w]\n┗━\$ '

## add user to a group
# sudo usermod -aG group user

export PATH=$PATH:$HOME/Git/ESP32-ToolChain/xtensa-esp32-elf/bin

# Created by `pipx` on 2023-11-08 16:13:48
export PATH="$PATH:/home/x230/.local/bin"
eval "$(register-python-argcomplete pipx)"
