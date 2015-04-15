# == Class: zabbix::userparameter
#
# This class can be used when you use hiera or The Foreman. With this tools
# you can't use and define. This make use of "create_resources".
#
# == Requirements
#
# Hiera or The Foreman
#
# == Parameters
#
# [*data*]
#  This is the data in YAML format
#
# == Example
#
# zabbix::userparameter::data:
#  MySQL:
#    content: UserParameter=mysql.ping,mysqladmin -uroot ping | grep -c alive
#
#
# === Authors
#
# Author Name: ikben@werner-dijkerman.nl
#
# === Copyright
#
# Copyright 2014 Werner Dijkerman
#

class zabbix::userparameter (
  $data = {},
) {
  $data_additional = hiera_hash('zabbix::userparameter::additional', {})
  $data_real       = merge($data, $data_additional)
  
  validate_hash($data_real)
  create_resources('zabbix::userparameters', $data_real)
}
