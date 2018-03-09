require "filemerger/version"
require "filemerger/poster"
require "filemerger/searcher"
require "filemerger/merger"
require "filemerger/configuration"
require "filemerger/generation/mergefile_generator"
require "json"

module Filemerger
  class Filemerger
    def self.begin_merge
      Poster.post_greeting
      config = Configuration.new

      merger = Merger.new(config)
      merger.merge_files
    end

    def self.setup
      MergefileGenerator.generate
    end
  end
end
