fx_version 'adamant'
game 'gta5'

description 'A simple GiveCar command for ESX Legacy'
lua54 'yes'
version '1.0.0'

shared_script '@es_extended/imports.lua'

client_scripts {
    '@es_extended/locale.lua',
    'client.lua',
}

server_scripts {
    '@es_extended/locale.lua',
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
}

dependency 'es_extended'
