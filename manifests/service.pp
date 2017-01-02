# == Class: etcd::service
#
# Class to manage the etcd service daemon
#
class etcd::service {
  if $::etcd::manage_service {
    if $::etcd::package_url {
      include ::systemd
      systemd::service { 'etcd':
        description => 'Etcd Key/Value store',
        execstart   => '/opt/etcd/etcd',
        wants       => ['network.target'],
      }
    }
    service { 'etcd':
      ensure => $::etcd::service_ensure,
      enable => $::etcd::service_enable,
    }
  }
}
