require_relative '../spec_helpers.rb'

require 'game-finder/config'

describe Config do
  include Config

  describe :config do
    it 'gets configuration' do
      expect(self).to receive(:load_config)
        .with("#{ENV['HOME']}/.game-finder.yaml").and_return('foo')
      expect(config).to eq 'foo'
    end

    it 'memoizes config' do
      @config = 'foo'
      expect(self).to_not receive(:load_config)
    end
  end

  describe :load_config do
    it 'returns a struct' do
      allow(File).to receive(:exist?).and_return(true)
      allow(YAML).to receive(:load_file).and_return({'foo' => 'bar'})
      expect(config.foo).to eq 'bar'
    end
  end

  describe :install_default_config do
    it 'writes a default config file' do
      expect(File).to receive(:read).with(Config::DEFAULT_CONFIG_PATH)
        .and_return('foo')
      expect(File).to receive(:write)
        .with(Config::CONFIG_PATH, 'foo').and_return(true)
      install_default_config
    end
  end
end
