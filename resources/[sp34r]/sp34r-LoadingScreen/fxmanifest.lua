fx_version 'cerulean'
game 'gta5'
description 'SkeletonNetworks'
version '1.0'
lua54 'yes'
server_script 'server.lua'
files {'html/assets/**', 'html/*'}
loadscreen { 'html/index.html' }
escrow_ignore {'server.lua'}

loadscreen_cursor 'yes'
loadscreen_manual_shutdown 'yes'
dependency '/assetpacks'