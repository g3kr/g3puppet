UPDATE mysql.user SET Password=PASSWORD('<%= scope.lookupvar('base-mysql::mysql_password') %>') WHERE User='root';
FLUSH PRIVILEGES;
