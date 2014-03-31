define master_mysql($mysql_user, $mysql_pwd) {
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
        source =>  "puppet:///modules/master_mysql/my.cnf",
    }   

    file { "/root/replica_user.sql":
                source => "puppet:///modules/master_mysql/replica_user.sql",
        }

    #Create a replication user
    exec { "create_replication_user":
#        path => ["/bin", "/usr/bin"],
        command => "mysql -u$mysql_user -p$mysql_pwd < /root/replica_user.sql",
        require => [File['/root/replica_user.sql']],
    }
        exec { "restart" :
 #               path => ["/bin", "/usr/bin", "/usr/sbin"],
                command => "service  mysql restart",
        }
   
}
