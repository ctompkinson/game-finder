require_relative '../spec_helpers.rb'

require 'game-finder/api'

include Api

describe Api do
  describe :request do
    let(:fastlane_resp) { File.read("#{File.dirname(__FILE__)}/../../fixtures/fastlane.json") }

    it 'makes a request with the given parameters to the api' do
      expect(self).to_not receive(:exit)
      WebMock.stub_request(:get, "#{Api::API_URI}/search?api_key=foo&format=json&query=fastlane")
        .with(:headers => {'User-Agent'=>'game-finder'})
        .to_return(:status => 200, :body => fastlane_resp, :headers => {})
      request('search', api_key: 'foo', query: 'fastlane')
    end

    it 'returns a hash' do
      expect(self).to_not receive(:exit)
      WebMock.stub_request(:get, "#{Api::API_URI}/search?api_key=foo&format=json&query=fastlane")
        .with(:headers => {'User-Agent'=>'game-finder'})
        .to_return(:status => 200, :body => fastlane_resp, :headers => {})
      expect(request('search', api_key: 'foo', query: 'fastlane')).to be_a Hash
    end

    it 'exits if a non 200 is returned' do
      expect(self).to receive(:exit).and_return false
      WebMock.stub_request(:get, "#{Api::API_URI}/search?api_key=foo&format=json&query=fastlane")
        .with(:headers => {'User-Agent'=>'game-finder'})
        .to_return(:status => 401, :body => fastlane_resp, :headers => {})
      request('search', api_key: 'foo', query: 'fastlane')
    end
  end
end
