kernel_release_version =
  if node['virtualization']['role'] == 'guest'
    node['kernel']['release'].gsub('generic', 'virtual')
  else
    node['kernel']['release']
  end

default['docker']['kernel_modules_package'] =
  ['linux-image-extra', kernel_release_version].join('-')

default['docker']['apt_repository_uri'] =
  'http://ppa.launchpad.net/dotcloud/lxc-docker/ubuntu'
