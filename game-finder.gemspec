lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'game-finder/version'

Gem::Specification.new do |s|
  s.name          = 'game-finder'
  s.version       = GameFinder::VERSION
  s.summary       = 'Game finding utility'
  s.description   = 'A command line tool to allow searching of games'
  s.authors       = ['Chris Tompkinson']
  s.email         = ['ctompkinson@gmail.com']
  s.homepage      = 'https://github.com/ctompkinson/game-finder'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 2.1'

  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(spec|packaging|coverage)/})
  end

  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'colorize', '0.8.1'
  s.add_dependency 'english', '0.6.3'
  s.add_dependency 'httparty', '0.14.0'
  s.add_dependency 'thor', '0.19.4'

  s.add_development_dependency 'rake', '11.2.2'
  s.add_development_dependency 'rspec', '3.6.0'
  s.add_development_dependency 'rubocop', '0.48.1'
  s.add_development_dependency 'simplecov', '0.12.0'
  s.add_development_dependency 'webmock', '1.22.6'
end
