require 'colorize'

module Filemerger
  class Poster
    # Configuration
    def self.post_configuration_search
      puts "🕵️‍♂️  Searching for Mergefile.yaml in #{Dir.pwd}".colorize(:blue)
    end

    def self.post_configuration_found
      puts "🤘  Found Mergefile.yaml...".colorize(:green)
    end

    def self.post_configuration_not_found
      puts "👿  Mergefile.yaml not found!".colorize(:red)
    end

    # General
    def self.post_greeting
      puts "====================== MERGER 👨‍💻  ======================".colorize(:green)
    end

    def self.post_file_created(file_name)
      puts "❇️  File #{file_name} created"
    end

    def self.post_nothing_found
      puts "0️⃣  No files matching specified masks found.".colorize(:blue)
    end

    def self.post_search_completed(pattern, count)
      puts "💁‍♀️  Found #{count} file(s) matching #{pattern}"
    end

    def self.post_file_not_found(file)
      puts "❗️  Couldn't find file #{file}".colorize(:red)
    end

    def self.post_merge_finished
      puts "✅  The merge has been successfuly completed.".colorize(:green)
    end
  end
end
