resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Supermarket'

version '1.0.1'

files {
	'html/ui.html',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js',
	'html/iransans.otf',
	-- default
	'html/img/default.png',
	'html/img/bread.png',
	'html/img/close.png',
	'html/img/croquettes.png',
	'html/img/water.png',
	'html/img/plus.png',
	'html/img/minus.png',
    'html/img/phone.png',
	'html/img/beer.png',
	'html/img/chips.png',
	'html/img/chocolate.png',
	'html/img/cigarette.png',
	'html/img/cupcake.png',
	'html/img/cocacola.png',
	'html/img/coffe.png',
	'html/img/hamburger.png',
	'html/img/icetea.png',
	'html/img/joint.png',
	'html/img/phone.png',
	'html/img/sandwich.png',
	'html/img/vodka.png',
	'html/img/raspberry.png',
	'html/img/c4_bank.png',
	'html/img/blowtorch.png',
	'html/img/whiskey.png',
	'html/img/vodkafruit.png',
	'html/img/tequila.png',
	'html/img/vodka.png',
	'html/img/whiskycoca.png',
	'html/img/hackerDevice.png',
	'html/img/wine.png'
}

ui_page 'html/ui.html'

client_scripts {
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/fa.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/fa.lua',
	'config.lua',
	'server/main.lua'
}

dependency 'es_extended'
