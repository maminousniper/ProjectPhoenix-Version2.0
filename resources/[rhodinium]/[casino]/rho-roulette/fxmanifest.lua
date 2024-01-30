version '1.0.2'
author 'freamee'
decription 'Aquiver rulett'
lua54 'yes'

client_scripts {
    'config.lua',
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
    'client/cl_main.lua'
} 

server_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    -- 'translations.lua',
    'server/sv_main.lua'
}

game 'gta5'
fx_version 'adamant'
