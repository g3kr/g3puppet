class base-mysql::install {
  
  package { "mysql-server": ensure => installed }
  package { "mysql": ensure => installed }

  service { "mysqld":
    enable => true,
    ensure => running,
    provider => upstart,
    require => Package["mysql-server"],
  }

  file { "/var/lib/mysql/my.cnf":
    owner => "mysql", group => "mysql",
    source => "puppet:///modules/base-mysql/my.cnf",
    notify => Service["mysqld"],
    require => Package["mysql-server"],
  }
 
  file { "/etc/my.cnf":
    require => File["/var/lib/mysql/my.cnf"],
    ensure => "/var/lib/mysql/my.cnf",
  }

  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p$mysql_password status",
    path => ["/bin", "/usr/bin"],
    command => "mysqladmin -uroot password $mysql_password",
    require => Service["mysqld"],
  }
}
