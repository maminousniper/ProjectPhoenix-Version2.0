fx_version 'cerulean'
games      { 'gta5' }


shared_scripts {
	'config.lua',
}


client_scripts{
	'@rho-lib/client/rho_dui.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'client/*.lua'
} 

server_scripts{
	'server/*.lua'
} 