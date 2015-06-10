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
  $config_only   = true,
  $packages      = $pennmush::params::packages) inherits pennmush::params {
  if ($config_only == false and $packages == false) {
    warning('Installation management is not available on this operating system.')
  }

  if ($config_only == false and $packages != false) {
    package { $packages: ensure => present }
  }
}
