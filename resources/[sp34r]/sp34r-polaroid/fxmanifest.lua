fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Palacios (Dovux Labs)'
description 'Polaroid'
version '1.1.0'
lua54 'yes'

shared_scripts {
  '@ox_lib/init.lua',
  'config/config.lua',
}
  
client_scripts {
  'config/config.js',
  'lua/client/cl_*.lua',
}
  
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'config/server_config.lua', 
  'config/inventories/*.lua',	
  'lua/server/sv_*.lua',
}

ui_page 'web/build/index.html'

files {
  'web/build/index.html',
  'web/build/static/js/*.js',
  'web/build/static/css/*.css'
}

dependencies {
  'screenshot-basic',
  'ox_lib',
  'oxmysql',
}

escrow_ignore { 
  'config/**.lua',
  'readme/*.lua',
}

dependency '/assetpacks'