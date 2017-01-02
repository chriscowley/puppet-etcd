# == Class: etcd
#
class etcd::install {
  if $::etcd::package_url {
    archive { "/tmp/etcd.tar.gz":
      ensure => present,
      source => $::etcd::package_url,
    }
  } elsif $::etcd::manage_package {
    package { $::etcd::package_name: ensure => $::etcd::ensure, }
  }
}
