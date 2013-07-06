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

  service { 'jetty':
    ensure     => $service_ensure,
    enable     => $service_enable,
  }

}
