# == Class: jetty::package
class jetty::package {
  # set params: in operation
  if $jetty::ensure == 'present' {

    if $jetty::version == false {
      $package_ensure = $jetty::autoupgrade ? {
          true  => 'latest',
          false => 'present',
        }
    }  else {
      $package_ensure = $jetty::version
    }

    # set params: removal
  } else {
    $package_ensure = 'purged'
  }

  package { $jetty::params::packages:
    ensure => $package_ensure
  }
}
