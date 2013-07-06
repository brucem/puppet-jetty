# Class jetty::package
class jetty::package {
  package{ $jetty::params::packages:
    ensure => 'present',
  }
}
