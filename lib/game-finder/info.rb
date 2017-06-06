require 'json'
require 'colorize'

require 'game-finder/api'
require 'game-finder/format'

# Looks up a game and shows you its information
class Info
  include Api
  include Format

  GAME_FIELD_LIST = 'name,developers,genres,publishers,platforms,' \
                    'dlcs,original_release_date'.freeze

  # TODO: MAKE IT SHOW ONLY ONE!
  def find(name, _options = {})
    search_results = request('search', field_list: 'id', query: name, limit: '1')['results']
    output request("game/#{search_results.first['id']}",
                   field_list: GAME_FIELD_LIST)['results']
  end

  def output(game)
    puts 'Name: '.yellow + game['name']
    puts 'Platforms: '.yellow + format_platforms(game['platforms']) \
      if game['platforms']
    puts 'Released: '.yellow + game['original_release_date'].split(' ').first \
      if game['original_release_date']
    puts 'Genres: '.yellow + format_genres(game['genres']) \
      if game['genres']
    puts 'Developers: '.yellow + format_developers(game['developers']) \
      if game['developers']
    puts 'DLCs:\n'.yellow + format_dlcs(game['dlcs']) \
      if game['dlcs']
  end
end
