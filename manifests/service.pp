#
class jetty::service {
  include jetty

  if $jetty::ensure == 'present' {
    $service_ensure = 'running'
    $service_enable = true
  } else {
    $service_ensure = 'stopped'
    $service_enable = false
  }

  file { '/etc/default/jetty':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/etc/default/jetty.erb"),
    require => Class['jetty::package'],
    notify  => Service['jetty'],
  }

  service { 'jetty':
    ensure     => $service_ensure,
    enable     => $service_enable,
  }

}
