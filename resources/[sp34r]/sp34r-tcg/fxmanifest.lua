
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'SoulSP34r'
description 'Trading Card Game'
version '2.0.0'
lua54 'yes'

shared_scripts {
  '@ox_lib/init.lua',
  'config/config.lua',
}

client_scripts {
  'lua/client/cl_*.lua',
  'config/config.js',
  'lua/client/cl_*.js',
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
  'web/build/static/css/*.css',
  'web/build/static/media/*.mp3',
}

escrow_ignore { 
  'config/**.lua',
  'readme/*.lua',
}
dependency '/assetpacks'