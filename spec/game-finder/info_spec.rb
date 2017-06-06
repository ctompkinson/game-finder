require_relative '../spec_helpers.rb'

require 'json'
require 'game-finder/info'

# rubocop:disable Metrics/BlockLength
describe Api do
  let(:i) { Info.new }
  let(:gears_search) do
    File.read("#{File.dirname(__FILE__)}/../../fixtures/gears_of_war_search.json")
  end
  let(:gears_game) { File.read("#{File.dirname(__FILE__)}/../../fixtures/gears_of_war_game.json") }

  describe :find do
    it 'Finds and outputs a given game' do
      expect(i).to receive(:request)
        .with('search', field_list: 'id', query: 'Gears of War')
        .and_return(JSON.parse(gears_search))
      expect(i).to receive(:request)
        .with('game/12231', field_list: Info::GAME_FIELD_LIST)
        .and_return(JSON.parse(gears_game))
      expect(i).to receive(:output).with(JSON.parse(gears_game)['results'])
      i.find('Gears of War')
    end
  end

  describe :output do
    it 'prints out game information' do
      expect(i).to receive(:puts).with("\e[0;33;49mName: \e[0mGears of War")
      expect(i).to receive(:puts).with("\e[0;33;49mPlatforms: \e[0mXbox 360, " \
                                       'Xbox 360 Games Store, PC, Xbox One')
      expect(i).to receive(:puts).with("\e[0;33;49mReleased: \e[0m2006-11-07")
      expect(i).to receive(:puts).with("\e[0;33;49mDevelopers: \e[0mEpic Games, " \
                                       'The Coalition, Psyonix Studios')
      expect(i).to receive(:puts).with("\e[0;33;49mGenres: \e[0mAction, Shooter")
      expect(i).to receive(:puts).with("\e[0;33;49mDLCs:\\n\e[0m" \
                                       "Multiplayer Map Pack 1\n" \
                                       'Hidden Fronts Map Pack')
      i.output(JSON.parse(gears_game)['results'])
    end
  end
end
