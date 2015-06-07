class pennmush::params {
   
  case $operatingsystem {
    /(Debian)/: {
      if $pennmush::mysql_support {
        $packages = 'pennmush-mysql'
      }
      else {
        $packages = 'pennmush'
      }
    }
    default:  {
    }
  }
}