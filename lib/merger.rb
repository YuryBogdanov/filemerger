require "merger/version"
require "merger/poster"
require "merger/searcher"
require "merger/filemerger"
require "json"

module Merger
  class Merger
    # What to do here:
    # 1. Post greeting
    # 2. Read user input (json)
    # 3. Post info (data acquired)
    # 4. Pass data found for files searching
    def self.begin_merge
      Poster.post_greeting
      puts "Searching for Mergefile.json in #{Dir.pwd}"
      file = File.read("Mergefile.json")
      data = JSON.parse(file)
      Poster.post_data_acquired

      found = Searcher.find_files(data["patterns"])
    end
  end
end
