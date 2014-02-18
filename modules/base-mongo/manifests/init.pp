class base-mongo(){
	$public_ip = $::ipaddress
	include base-mongo::params, base-mongo::install, base-mongo::config
}
