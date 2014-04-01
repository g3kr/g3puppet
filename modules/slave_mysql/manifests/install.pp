define slave_mysql($mysql_host, $mysql_user, $mysql_pwd, $mysql_log_file, $mysql_log_position) {

	Exec {
		path => [
			'/usr/local/bin',
			'/opt/local/bin',
			'/usr/bin',
			'/usr/sbin',
			'/bin',
			'/sbin'],
			logoutput => true,
	}

	file { "/etc/mysql/conf.d/gayatri.cnf":
		source =>  "puppet:///slave_mysql/my.cnf",
	}	

	file { "/root/change_master.sql":
               content => template("slave_mysql/change_master.sql"),
        }

	#Define Slave
	exec { "define_slave":
		command => "service mysql restart; mysql -u $mysql_user -p$mysql_pwd < /root/change_master.sql",
		require => [File['/root/change_master.sql'], File['/etc/mysql/conf.d/gayatri.cnf']],
	}
        
}

