-- Resource Metadata
fx_version 'adamant'
games { 'gta5' }

author 'SoulSp34r'
description 'Royal Loading Screen'
version '1.0.0'

lua54 'yes'

loadscreen_manual_shutdown "yes"
-- Client Script
client_script "client.lua"

loadscreen 'ui/index.html'

client_script "client.lua"

files {
    'ui/index.html',
    'ui/css/style.css',
    'ui/js/jquery.min.js',
    'ui/js/script.js',
    'ui/fonts/Prime-Regular.woff2',
    'ui/img/poster.png',
    'ui/img/volume.svg',
    'ui/img/volume-mute.svg',
    'ui/img/cursor.svg',
    'ui/config.js',
    'ui/royalLS.mp4'
}
