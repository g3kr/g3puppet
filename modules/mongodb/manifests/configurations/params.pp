# Defaults for mongodb::config
 
class mongodb::configurations::params {
# mongodb configuration file entries:
$dbpath         = "/data/db/"
$logpath        = "/data/log/mongodb.log"
$logappend      = true
$bind_ip        = "0.0.0.0"
$port           = 27017
$replSet        = ""
$journal        = false
$nojournal      = true
$ulimit_nofile = 1024
}
