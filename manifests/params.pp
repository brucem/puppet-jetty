#
class jetty::params {
  case $::osfamily {
    'Debian': {
      $packages  = ['jetty', 'libjetty-extra']
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only supports osfamily Debian")
    }
  }
}
