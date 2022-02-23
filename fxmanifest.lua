fx_version 'cerulean'
game 'gta5'

description 'QB-SmallResources'
version '1.0.0'

shared_script 'config.lua'
server_script 'server/*.lua'
client_scripts {
	'client/*.lua',
	'client/maps/after_hours/nightclub/*.lua',
	'client/maps/after_hours/nightclub_exteriors/*.lua',
	'client/maps/bikers/businesses/cocaine/*.lua',
	'client/maps/bikers/businesses/counterfeit_cash/*.lua',
	'client/maps/bikers/businesses/document_forgery/*.lua',
	'client/maps/bikers/businesses/meth/*.lua',
	'client/maps/bikers/businesses/weed/*.lua',
	'client/maps/bikers/clubhouses/clubhouse_1/*.lua',
	'client/maps/bikers/clubhouses/clubhouse_2/*.lua',
	'client/maps/bikers/gang/*.lua',
	'client/maps/doomsday/facility/*.lua',
	'client/maps/finance_felony/offices/arcadius_business_centre/*.lua',
	'client/maps/finance_felony/offices/lom_bank/*.lua',
	'client/maps/finance_felony/offices/maze_bank/*.lua',
	'client/maps/finance_felony/offices/maze_bank_west/*.lua',
	'client/maps/finance_felony/organization/*.lua',
	'client/maps/gunrunning/bunker/*.lua',
	'client/maps/gunrunning/yacht/*.lua',
	'client/maps/heists/aircraft_carrier/*.lua',
	'client/maps/heists/yacht/*.lua',
	'client/maps/import_export/garages/arcadius_business_centre/*.lua',
	'client/maps/import_export/garages/lom_bank/*.lua',
	'client/maps/import_export/garages/maze_bank/*.lua',
	'client/maps/import_export/garages/maze_bank_west/*.lua',
	'client/maps/import_export/vehicle_warehouse/*.lua',
	'client/maps/smugglers/hanger/*.lua'
}

data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

files {
	'events.meta',
	'popgroups.ymt',
	'relationships.dat'
}

exports {
	'HasHarness'
}

lua54 'yes'