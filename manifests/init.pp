# Class: pennmush
#
# This module manages pennmush
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class pennmush (
  $mysql_support = false,
  $config_only   = true) {
  case $operatingsystem {
    'Debian' : {
      if ($mysql_support) {
        $packages = 'pennmush-mysql'
      } else {
        $packages = 'pennmush'
      }
    }
    default  : {
      $packages = false
    }
  }

  if ($config_only == false and $packages == false) {
    warning('Installation management is not available on this operating system.')
  }

  if ($config_only == false and $packages != false) {
    package { $packages: ensure => present }
  }
}
