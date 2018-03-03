require "merger/version"
require "merger/poster"
require "merger/filemerger"
require "json"

module Merger
  class Merger
    def self.begin_merge
      Poster.post_greeting
      puts "Searching for Mergefile.json in #{Dir.pwd}"
      file = File.read("Mergefile.json")
      data = JSON.parse(file)
      Poster.post_data_acquired

      Filemerger.find_files(data["patterns"])
    end
  end
end
