fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'dev-pickme'
description 'Taco Bussines'
version '1.0.0'

shared_script{
    '@ox_lib/init.lua',
}

client_scripts {
    'client.lua',
}

server_scripts {
    'server.lua',
}

dependencies {
    'ox_inventory',
    'ox_lib'
}