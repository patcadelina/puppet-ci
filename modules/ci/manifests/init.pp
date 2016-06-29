class ci {
  include nginx

  class { 'jenkins':
    version            => 'latest',
    configure_firewall => false,
  }

  nginx::resource::vhost { 'default':
    listen_port => 80,
    proxy       => 'http://127.0.0.1:8080',
  }
}
