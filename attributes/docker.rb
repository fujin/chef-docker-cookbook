default['docker']['kernel_modules_package'] =
  ['linux-image-extra', node['kernel']['release']].join('-')

default['docker']['apt_repository_uri'] =
  'http://ppa.launchpad.net/dotcloud/lxc-docker/ubuntu'
