class base-mysql::install {
  
  package { "mysql-server": 
	ensure => installed 
	}
  package { "mysql-client": 
	ensure => installed 
	}

  service { "mysql":
    enable => true,
    ensure => running,
    provider => upstart,
    require => Package["mysql-server"],
  }

  file { "/root/root_pwd.sql":
	content => template("base-mysql/root_pwd.sql"),
	require => Package["mysql-server"],
  }
 
#This exec will run fine on first run and after that password for root user will be changed from default one to another one
  exec { "set-mysql-password":
#    unless => "mysqladmin -uroot -p$mysql_password status",
    path => ["/bin", "/usr/bin"],
# Updating the default password with our custom password
    command => "mysql -uroot < /root/root_pwd.sql",
    require => [Service["mysql"], File['/root/root_pwd.sql']],
  }
}
