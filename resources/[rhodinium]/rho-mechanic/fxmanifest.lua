fx_version 'cerulean'
game 'gta5'

description 'orangelist#4870 - Gang Turfs | https://orangelist.tebex.io/'

version '1.0.9'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/menu.css',
    'html/js/ui.js',
    'html/imgs/logo.png',
    'html/sounds/wrench.ogg',
    'html/sounds/respray.ogg'
}

shared_scripts {
    '@ox_lib/init.lua', -- uncomment if you use ox menu
    'shared/*.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client/ui.lua',
    'client/bennys.lua',
    'client/main.lua',
    'client/crafting.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

escrow_ignore {
	'server/*.lua',
    'client/*.lua',
    'shared/*.lua',
	'README.md',
	'LICENSE',
}

dependencies {
	'qb-core',
	'qb-menu',
	'qb-target',
    'qb-input'
}

lua54 'yes'

dependency '/assetpacks'