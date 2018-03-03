require 'colorize'

module Merger
  class Poster
    def self.post_greeting
      puts "====================== MERGER 👨‍💻  ======================".colorize(:green)
      puts "Preparing for files merging...".colorize(:green)
    end
  end
end
