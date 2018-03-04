require 'thor'
require 'merger'

module Merger
  class CLI < Thor

    desc "Begins merging", "Checks if there are files and merges them"
    def merge
      Merger.begin_merge
    end

  end
end
