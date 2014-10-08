#!/bin/bash

if [ -z $1 ]; then
    echo "Please use one of the following flags:"
    echo "  --copy-home (copy .mjolnir to your home folder)"
    echo "  --init (install Mjolnir, plugins, and copy to your home folder)"
    echo "  --install (install Mjolnir)"
    echo "  --plugins (install plugins listed in this file)"
    exit 0
fi

check_brew(){
    if [ ! -e /usr/local/bin/brew ]; then
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    fi
}

check_cask(){
    CASK=`brew list | grep brew-cask`
    if [ -z ${CASK} ]; then
        brew install caskroom/cask/brew-cask
    fi
}

plugins(){
    check_brew

    if [ ! -e /usr/local/bin/luarocks ]; then
        brew install luarocks
    fi

# install plugins
    luarocks install mjolnir.alert
    luarocks install mjolnir.application
    luarocks install mjolnir.fnutils
    luarocks install mjolnir.hotkey
    luarocks install mjolnir.sd.grid
}

copy_home(){
    cp -r ./.mjolnir ${USER}/.mjolnir
}

install_mjolnir(){
    check_brew
    check_cask

    brew cask install mjolnir
}

init(){
    install_mjolnir
    plugins
    copy_home
}

exit 0
