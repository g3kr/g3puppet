include mongodb
mongo{'testMaster':port => 27027, hostName => "127.0.0.1", replSet => test,master => master, master_port => 27027, masterHostName => "127.0.0.1", require => Class['mongodb'],}
mongo{'testSlave1':port => 27028, hostName => "127.0.0.1", replSet => test,master => slave, master_port => 27027, masterHostName => "127.0.0.1", require => [Mongo['testMaster'], Class['mongodb']],}
