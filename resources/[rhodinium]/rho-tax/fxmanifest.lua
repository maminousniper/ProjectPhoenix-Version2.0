fx_version "cerulean"
author 'Rhodinium'
description 'A Tax System'
version '0.0.1'

game "gta5"

lua54 "yes"

client_script {
    '@qb-core/client/cl_rpc.lua',
    'client/*.lua',
}

server_script {
    '@qb-core/server/sv_rpc.lua',
    'server/*.lua',
}

 
escrow_ignoe 'config.lua'