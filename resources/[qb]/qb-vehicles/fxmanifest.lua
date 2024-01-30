fx_version 'cerulean'
game 'gta5'
description 'QB'
version '1.2.5'


client_script {
    '@qb-core/client/cl_rpc.lua',
    'client/*.lua',
}

server_script {
    '@qb-core/server/sv_rpc.lua',
    'server/*.lua',
}

lua54 'yes'