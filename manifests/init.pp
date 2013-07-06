# Class: jetty
#
# == Variables
#
# == Usage
#
class jetty (
  $ensure           = 'present',
  $service_settings = $jetty::params::service_settings,
) inherits jetty::params {

  require java
  #### Manage actions
  anchor {'jetty::begin': }
  anchor {'jetty::end': }

  # package
  class { 'jetty::package': }

  # config
  class { 'jetty::config': }

  # service(s)
  class { 'jetty::service': }

  if $ensure == 'present' {
    # we need the software before configuring it
    Anchor['jetty::begin']
    -> Class['jetty::package']
    -> Class['jetty::config']

    # we need the software before running a service
    Class['jetty::package'] -> Class['jetty::service']
    Class['jetty::config']  -> Class['jetty::service']

    Class['jetty::service']
    -> Anchor['jetty::end']
    } else {
      # make sure all services are getting stopped before software removal
      Anchor['jetty::begin']
      -> Class['jetty::service']
      -> Class['jetty::package']
      -> Anchor['jetty::end']
    }
}
