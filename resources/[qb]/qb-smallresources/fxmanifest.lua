fx_version 'cerulean'
game 'gta5'

description 'QB-SmallResources'
version '1.3.1'

shared_scripts {
    '@ox_lib/init.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- Change to the language you want
    'config.lua'
}
server_script 'server/*.lua'
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}

data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

files {
    'ui/index.html',
    'events.meta',
    'popgroups.ymt',
    'relationships.dat'
}

ui_page 'ui/index.html'

lua54 'yes'
use_experimental_fxv2_oal 'yes'
