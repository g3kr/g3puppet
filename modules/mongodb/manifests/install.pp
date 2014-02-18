# class mongodb::install
#
# Installs mongdb
# This class is ubuntu specific
 
class mongodb::install{
 
exec { "apt update":
path => "/bin:/usr/bin",
command => "apt-get update",
}
 
package { mongodb :
ensure => installed,
require => Exec["apt update"]
}
 
service { "mongodb":
enable => true,
ensure => running,
}
}
