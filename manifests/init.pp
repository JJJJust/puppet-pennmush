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
  $mysql_support  = false,
  $config_only    = true,
  $packages = $pennmush::params::packages
) inherits pennmush::params {

 case $operatingsystem {
    /(Debian)/: {}
    default:  {
      unless $config_only {
        warning('Installation management not supported for this operating system. $config_only forced to "true".')
        $config_only = true
      }
    }      
 }

  unless $config_only {
    package { $packages:
      ensure => present
    }
  }
}
