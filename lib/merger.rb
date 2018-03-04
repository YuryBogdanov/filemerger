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
      config = Configuration.new
      Filemerger.merge_files(config)
    end
  end
end
