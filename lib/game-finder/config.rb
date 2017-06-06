require 'yaml'

require 'game-finder/util'

include Util

# Helpers for loading and interacting with configuration
module Config
  CONFIG_PATH         = "#{ENV['HOME']}/.game-finder.yaml".freeze
  DEFAULT_CONFIG_PATH = "#{File.dirname(__FILE__)}/../../files/default_config.yaml".freeze

  def config
    @config ||= load_config(CONFIG_PATH)
  end

  def load_config(config_path)
    install_default_config unless File.exist? config_path
    c = symbolize(YAML.load_file(config_path))
    Struct.new(*c.keys).new(*c.values)
  end

  def install_default_config
    # Skip using FileUtils.cp to avoid image magick installation
    File.write(CONFIG_PATH, File.read(DEFAULT_CONFIG_PATH))
  end
end
