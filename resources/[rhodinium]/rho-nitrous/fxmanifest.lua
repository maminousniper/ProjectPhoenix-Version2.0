fx_version 'cerulean'
game 'gta5'

name "Brazzers Nitrous"
author "Brazzers Development | MannyOnBrazzers#6826"
version "2.0"

lua54 'yes'

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

shared_scripts {
	'@ox_lib/init.lua', -- Required
	'shared/*.lua',
}

escrow_ignore {
    'client/open.lua',
    'server/open.lua',
	'shared/*.lua',
	'README/*lua',
}
dependency '/assetpacks'