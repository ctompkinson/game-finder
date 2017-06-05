require 'colorize'

class Out
  def self.error(msg)
    puts msg.red
    1
  end
end
