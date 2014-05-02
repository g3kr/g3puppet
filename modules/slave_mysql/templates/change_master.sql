CHANGE MASTER TO MASTER_HOST='<%= mysql_host %>',MASTER_USER='repl', MASTER_PASSWORD='slavepass', MASTER_LOG_FILE='<%= mysql_log_file %>', MASTER_LOG_$
start slave;
