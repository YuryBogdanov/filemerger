require "merger/version"
require "merger/poster"

module Merger
  class Merger
    def self.begin_merge
      Poster.post_greeting
    end
  end
end
