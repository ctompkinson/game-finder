require 'json'
require 'colorize'

require 'game-finder/api'

class Info
  include Api

  def game(name, _options = {})
    output request('game',
                   field_list: 'name,developers,description,' \
                               'genres,publishers,dlcs,original_release_date',
                   name: name)
  end

  def output(result)
    puts result
  end

  def format_platforms(platforms)
    platforms.map { |platform| platform['name'] }.join(', ')
  end
end
