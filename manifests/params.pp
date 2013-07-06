#
class jetty::params {
  case $::osfamily {
    'Debian': {
      $packages  = ['jetty', 'libjetty-extra']

      # default service settings
        $service_settings = {
          'NO_START'           => '0',
          'JETTY_USER'         => 'jetty',
          'JETTY_HOST'         => '127.0.0.1',
          'JETTY_PORT'         => '8080',
          'JETTY_SHUTDOWN'     => '30',
          'JETTY_ARGS'         => '',
          'JAVA_OPTIONS'       => '"-Xmx256m -Djava.awt.headless=true"',
          'JAVA_HOME'          => "/usr/lib/jvm/java-7-openjdk-${::architecture}/",
          'JDK_DIRS'           => '',
          'JETTY_TMP'          => '/var/cache/jetty',
          'JETTY_START_CONFIG' => '/etc/jetty/start.config',
          'LOGFILE_DAYS'       => '14'
        }

    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only supports osfamily Debian")
    }
  }
}
