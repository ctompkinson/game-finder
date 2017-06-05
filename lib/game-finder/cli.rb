require 'thor'
require 'game-finder/search'

class Cli < Thor
  desc 'search', 'Search for game titles'
  def search(*query)
    Search.new.game(query, options)
  end

  desc 'info', 'Display info for a specific game title'
  def info
    raise 'unimplemented'
  end
end
