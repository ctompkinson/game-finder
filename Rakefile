TRAVELING_RUBY_VERSION = '20150210-2.2.0'.freeze
ENTRY_POINT = 'game-finder.rb'.freeze
GEMSPEC = 'game-finder.gemspec'.freeze

task default: ['test']

task :install do
  sh 'bundle install'
end

task :clean do
  sh 'rm *.tar.gz             || true'
  sh 'rm -rf packaging/vendor || true'
  sh 'rm packaging/*.tar.gz   || true'
  sh 'rm *.gem                || true'
end

################################################################################
# Test
#
namespace 'test' do
  desc 'Run all tests'
  task all: %i[unit lint]

  desc 'Run just the unit tests'
  task :unit do
    separator('Unit tests')
    sh 'bundle exec rspec --pattern "spec/**/*_spec.rb"'
  end

  desc 'Lint the code'
  task :lint do
    separator('Lint tests')
    sh 'rubocop lib/**/* spec/**/* Rakefile'
  end
end

desc 'Runs all tests'
task test: ['test:all']

################################################################################
# Build
#
namespace :build do
  desc 'Builds the gem'
  task :gem do
    sh "gem build #{GEMSPEC}"
  end
end

################################################################################
# Packaging
#

desc 'Create all packages'
task package: ['package:linux:x86', 'package:linux:x86_64', 'package:osx']

namespace :package do
  namespace :linux do
    desc 'Package your app for Linux x86'
    task x86: "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-x86.tar.gz" do
      separator 'Packaging Linux x86'
      create_package('linux-x86')
    end

    desc 'Package your app for Linux x86_64'
    task x86_64: "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-x86_64.tar.gz" do
      separator 'Packaging Linux x86_64'
      create_package('linux-x86_64')
    end
  end

  desc 'Package your app for OS X'
  task osx: "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-osx.tar.gz" do
    separator 'Packaging Linux OSX'
    create_package('osx')
  end
end

file "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-x86.tar.gz" do
  download_runtime('linux-x86')
end

file "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-x86_64.tar.gz" do
  download_runtime('linux-x86_64')
end

file "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-osx.tar.gz" do
  download_runtime('osx')
end

def create_package(target)
  package_dir = "#{package_name}-#{version}-#{target}"
  regenerate_packing_dir(package_dir)
  copy_project_files(package_dir)
  install_gem_dependencies(package_dir)
  install_ruby(target, package_dir)
  add_wrapper(package_dir)
  create_tar(package_dir) unless ENV['DIR_ONLY']
end

def regenerate_packing_dir(package_dir)
  sh "rm -rf #{package_dir}"
  sh "mkdir -p #{package_dir}/lib"
  sh "mkdir -p #{package_dir}/bin"
  sh "mkdir -p #{package_dir}/files"
  sh "mkdir #{package_dir}/ruby"
end

def copy_project_files(package_dir)
  sh "cp -r lib/* #{package_dir}/lib/"
  sh "cp -r bin/* #{package_dir}/bin/"
  sh "cp -r files/* #{package_dir}/files/"
end

def install_gem_dependencies(package_dir)
  sh 'mkdir -p packaging/tmp'
  sh 'cp Gemfile Gemfile.lock packaging/tmp/'
  Dir.chdir('packaging/tmp') do
    sh 'BUNDLE_IGNORE_CONFIG=1 bundle install --path ../vendor --without development'
  end
  sh 'rm -rf packaging/tmp'
  sh 'rm -f packaging/vendor/*/*/cache/*'
  sh "cp -pR packaging/vendor #{package_dir}/"
  sh "cp Gemfile Gemfile.lock #{package_dir}/vendor/"
  sh "mkdir #{package_dir}/vendor/.bundle"
  sh "cp packaging/bundler-config #{package_dir}/vendor/.bundle/config"
end

def install_ruby(target, package_dir)
  sh "tar -xzf packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-#{target}.tar.gz " \
     "-C #{package_dir}/ruby"
end

def add_wrapper(package_dir)
  sh "cp packaging/wrapper.sh #{package_dir}/game-finder"
  sh "chmod u+x #{package_dir}/game-finder"
end

def create_tar(package_dir)
  sh "tar -czf #{package_dir}.tar.gz #{package_dir}"
  sh "rm -rf #{package_dir}"
end

def download_runtime(target)
  sh 'cd packaging && curl -L -O --fail ' \
     'https://d6r77u77i8pq3.cloudfront.net/releases/' \
     "traveling-ruby-#{TRAVELING_RUBY_VERSION}-#{target}.tar.gz"
end

################################################################################
# Helpers
#

def version
  '1.0.0'
end

def package_name
  'game-finder'
end

def separator(text)
  puts
  puts '-' * 80
  puts "- #{text.yellow}"
  puts '-' * 80
  puts
end

# Define color methods to avoid gem depedencies
class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end
end
