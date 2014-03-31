define slave_mysql($mysql_host, $mysql_user, $mysql_pwd, $mysql_log_file, $mysql_log_position) {
	file { "/etc/my.cnf":
		source =>  "puppet:///slave_mysql/my.cnf",
	}	

	file { "/root/change_master.sql":
               content => template("slave_mysql/change_master.sql"),
        }

	#Define Slave
	exec { "define_slave":
		path => ["/bin", "/usr/bin"],
		command => "mysql -u$mysql_user -p$mysql_pwd < /root/change_master.sql",
		require => [File['/root/change_master.sql']],
	}
        
}
