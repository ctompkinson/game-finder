require_relative '../spec_helpers.rb'

require 'json'

require 'game-finder/search'

describe Search do
  let(:fastlane_resp) { File.read("#{File.dirname(__FILE__)}/../../fixtures/fastlane.json") }
  let(:s) { Search.new }

  describe :game do
    it 'searches and outputs games information' do
      expect(s).to receive(:request)
        .with('search',
              resources: 'game',
              field_list: 'name,original_release_date,platforms',
              query: 'foo').and_return('foo')
      expect(s).to receive(:output).with('foo').and_return(true)
      s.game('foo')
    end
  end

  describe :output do
    it 'outputs game information' do
      expect(s).to receive(:puts).with("\e[0;33;49mName: \e[0mFastlane Pinball")
      expect(s).to receive(:puts).with("\e[0;33;49mPlatforms: \e[0mPC")
      expect(s).to receive(:puts).with(no_args)
      s.output(JSON.parse(fastlane_resp))
    end
  end
end
