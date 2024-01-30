fx_version 'cerulean'
games { 'gta5' }

author 'Rhodinium'
description 'rho-chopshop job for QBCORE'
version '1.1.0'

lua54 'yes'

shared_script {
    '@ox_lib/init.lua',
    'config.lua',

}

client_scripts {
    "client/*.lua"
}

server_scripts {
    "server.lua"
}

escrow_ignore {
    "client/*.lua",
    "server.lua",
	"config.lua"
}
dependency '/assetpacks'