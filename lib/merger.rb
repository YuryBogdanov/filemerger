require "merger/version"
require "merger/poster"
require "merger/searcher"
require "merger/filemerger"
require "merger/configuration"
require "json"

module Merger
  class Merger
    def self.begin_merge
      Poster.post_greeting
      puts "Searching for Mergefile.json in #{Dir.pwd}"
      
      config = Configuration.new

      Poster.post_data_acquired

      Filemerger.merge_files(config)
    end
  end
end
