# == Class: etcd
#
class etcd::install {
  if $::etcd::package_url {
    archive { '/tmp/etcd.tar.gz':
      ensure          => present,
      source          => $::etcd::package_url,
      extract         => true,
      extract_path    => '/opt/etcd',
      extract_command => 'tar xfz %s --strip-components=1',
      creates         => '/opt/etcd/etcd',

    }
  } elsif $::etcd::manage_package {
    package { $::etcd::package_name: ensure => $::etcd::ensure, }
  }
}
