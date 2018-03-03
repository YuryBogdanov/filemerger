require "merger/version"
require "merger/poster"
require "json"

module Merger
  class Merger
    def self.begin_merge
      Poster.post_greeting

      file = File.read("Mergefile.json")
      data = JSON.parse(file)
      puts data["patterns"]
    end
  end
end
