fx_version 'cerulean'
game 'gta5'

description 'Beehive Script'
version '2.1'
author 'Snipe'

lua54 'yes'

shared_scripts { 
    '@ox_lib/init.lua',
	'config.lua'
}

client_scripts{
    'utils/cl_utils.lua',
    
    'client/open/cl_customise.lua',
    'client/open/cl_menu.lua',
    'client/open/cl_progressbar.lua',
    'client/encrypted/cl_main.lua',
} 

server_scripts{
    'utils/sv_utils.lua',
    'server/encrypted/sv_main.lua',
    'server/open/sv_customise.lua',
    'server/open/sv_inventory.lua',
} 

escrow_ignore {
    'config.lua',
    'utils/sv_utils.lua',
    'utils/cl_utils.lua',
    'server/open/sv_customise.lua',
    'server/open/sv_inventory.lua',
    'client/open/cl_customise.lua',
    'client/open/cl_menu.lua',
    'client/open/cl_progressbar.lua',
}

data_file 'DLC_ITYP_REQUEST' 'stream/beehive.ytyp'
dependency '/assetpacks'