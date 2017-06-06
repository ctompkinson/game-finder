require 'colorize'

# Helper methods for printing
class Out
  def self.error(msg)
    puts msg.red
    1
  end
end
