kernel_type =
  case node['virtualization']['role']
  when 'guest'
    'virtual'
  else
    'generic'
  end

default['docker']['kernel_modules_package'] =
  ['linux-image-extra', kernel_type].join('-')

default['docker']['apt_repository_uri'] =
  'http://ppa.launchpad.net/dotcloud/lxc-docker/ubuntu'
