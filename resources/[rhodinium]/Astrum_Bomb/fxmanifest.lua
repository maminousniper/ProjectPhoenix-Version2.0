fx_version "cerulean"

game "gta5"

author "Astrum Studios"
version "1.0.0"

lua54 "yes"

ui_page "html/index.html"

client_script {
  "framework/client.lua",
  "client/**",
}
server_script {
  "framework/server.lua",
  "server/**",
}
shared_script {
  "config.lua",
  "@ox_lib/init.lua",
}

files {
  "html/**",
}

escrow_ignore {
  "config.lua",
  "framework/**"
}

data_file "DLC_ITYP_REQUEST" "stream/lev_briefcase.ytyp"

dependency '/assetpacks'