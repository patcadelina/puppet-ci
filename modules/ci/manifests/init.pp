class ci {
  include nginx
  include jenkins

  nginx::resource::vhost { 'default':
    listen_port      => 80,
    proxy            => 'http://127.0.0.1:8080',
    proxy_set_header => [
      'X-Forwarded-Proto $scheme'
    ],
  }
}
