fx_version 'cerulean'
game 'gta5'
description 'Drug Locations'
author 'Rocco'
version '1.0.1'
lua54 'yes'

client_scripts {
    'client/*.lua',
    'config.lua'
}

server_scripts {
    'server/main.lua',
    'config.lua'
}

shared_scripts {
    'config.lua'
}

escrow_ignore {
    'config.lua'
}