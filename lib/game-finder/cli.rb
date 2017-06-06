require 'thor'
require 'game-finder/search'
require 'game-finder/info'

class Cli < Thor
  desc 'search', 'Search for game titles'
  def search(*query)
    Search.new.game(query, options)
  end

  desc 'info', 'Display info for a specific game title'
  def info(*name)
    Info.new.game(name, options)
  end
end
