#init.pp
 
class mongodb {
include mongodb::config
include mongodb::install
}
