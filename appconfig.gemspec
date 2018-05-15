Gem::Specification.new { |s|
  s.name        = 'appconfig'
  s.version     = '0.0.1'
  s.author      = 'Honeypot GmbH'
  s.email       = 'hello@honeypot.io'
  s.homepage    = 'http://github.com/honeypotio/appconfig'
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'Keep all the configuration variables under a single namespace.'
  s.description = 'Create config.yml and secrets.yml in which you can store your configuration that eventually you retrieve from a single global object.'

  s.license     = 'WTFPL'

  s.files         = Dir['lib/**/*.rb']
  s.require_paths = ['lib']
}
