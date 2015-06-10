class pennmush::params {
  case $operatingsystem {
    /(?i:Debian)/ : {
      if $pennmush::mysql_support {
        $packages = 'pennmush-mysql'
      } else {
        $packages = 'pennmush'
      }
    }
    default       : {
      $packages = false
    }
  }
}
