# class mongodb::config
#
# Manages the mongodb configuration file
#
 
class mongodb::config(
$dbpath         =$mongodb::configurations::params::dbpath,
$logpath        =$mongodb::configurations::params::logpath,
$logappend      =$mongodb::configurations::params::logappend,
$bind_ip        =$mongodb::configurations::params::bind_ip,
$port           =$mongodb::configurations::params::port,
$ulimit_nofile  =$mongodb::configurations::params::ulimit_nofile,
$replSet        =$mongodb::configurations::params::replSet,
$journal	=$mongodb::configurations::params::journal,
$nojournal      =$mongodb::configurations::params::nojournal
) inherits mongodb::configurations::params {
file { '/etc/init/mongodb.conf':
content => template("mongodb/etc-init-mongodb.conf.erb"),
mode    => '644',
notify  => Service['mongodb'],
}
file { '/etc/mongodb.conf':
content => template("mongodb/etc-mongodb.conf.erb"),
mode    => '644',
notify  => Service['mongodb'],
}
 
file { $logpath:
ensure => present,
mode => '0644',
}
 
file { $dbpath:
ensure => directory,
mode => '0777',
}
 
Class ['mongodb::config'] -> Class['mongodb::install']
}
