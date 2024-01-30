description 'shud'
name ' hud'
author 'bp_shud'
version 'v1.0.0'



ui_page 'html/index.html'


files {
  'html/index.html',
  'html/*.js',
  'html/*.css',
  'html/*.png',
  'html/*.JPG',
  'html/*.svg',
  'html/sounds/*.ogg',
  'html/*.woff',
  'html/*.otf',
  'html/weaponimages/*.png'
  -- 'html/othericons/*.svg'





    

}

client_scripts {
    'config.lua',
    'client.lua'

}

server_scripts {
    'config.lua',
    'server.lua'
}

exports {
  'progbaractive'
  
}




lua54 'yes'

escrow_ignore {
  'config.lua',
}



fx_version 'adamant'
games {'gta5'}
dependency '/assetpacks'