require 'json'
require 'colorize'

require 'game-finder/api'

# Allows you to search for games
class Search
  include Api
  include Format

  def game(query, _options = {})
    output request('search',
                   resources: 'game',
                   field_list: 'name,original_release_date,platforms',
                   query: query)
  end

  def output(result)
    result['results'].each do |game|
      puts 'Name: '.yellow + game['name']
      puts 'Platforms: '.yellow + format_platforms(game['platforms']) if game['platforms']
      puts 'Release: '.yellow + game['original_release_date'].split(' ').first \
        if game['original_release_date']
      puts
    end
  end
end
