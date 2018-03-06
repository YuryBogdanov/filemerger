require "filemerger/version"
require "filemerger/poster"
require "filemerger/searcher"
require "filemerger/merger"
require "filemerger/configuration"
require "json"

module Filemerger
  class Filemerger
    def self.begin_merge
      Poster.post_greeting
      config = Configuration.new

      Merger.merge_files(config)
    end


    private

    def self.xcode_project(config)
      unless config.xcode_project.nil?
        return Xcode.new(config)
      else
    end
  end
end
