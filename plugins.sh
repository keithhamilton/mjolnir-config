#!/bin/bash

if [ ! -e /usr/local/bin/luarocks ]; then
    brew install luarocks
fi

# install plugins
luarocks install mjolnir.alert
luarocks install mjolnir.application
luarocks install mjolnir.fnutils
luarocks install mjolnir.hotkey
luarocks install mjolnir.sd.grid

exit 0
