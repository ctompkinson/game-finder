## TODO: Clean up GemSpec

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
  s.homepage      = 'github.com/ctompkinson/game-finder'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 2.1'

  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(spec|packaging|coverage)/})
  end

  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  # TODO: Add gem versions
  s.add_dependency 'colorize'
  s.add_dependency 'english'
  s.add_dependency 'httparty'
  s.add_dependency 'thor'
  s.add_dependency 'colorize'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
end
