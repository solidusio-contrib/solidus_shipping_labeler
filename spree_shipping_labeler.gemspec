# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY

  s.name        = 'solidus_shipping_labeler'
  s.version     = '2.3.0'
  s.authors     = ["Daniel Pritchett, Jason Fleetwood-Boldt"]
  s.email       = 'dpritchett@gmail.com'
  s.homepage    = 'http://github.com/solidusio-contrib/solidus_shipping_labeler'
  s.summary     = 'Solidus extension for providing shipping and return labels for FedEx shipments'
  s.description = 'Solidus extension for providing shipping and return labels for FedEx shipments'
  s.required_ruby_version = '>= 1.9.3'
  s.rubygems_version      = '1.3.6'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency('solidus_core',   '>= 1.0')
  s.add_dependency('coffee-rails', '> 4.0.0')
  s.add_dependency('fedex',        '>= 3.6.1')

  s.add_development_dependency 'pry'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'capybara', '~> 2.0'
  s.add_development_dependency 'database_cleaner', '~> 1.0.1'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'shoulda-matchers', '>= 3.0.1'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
