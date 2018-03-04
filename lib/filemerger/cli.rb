require 'thor'
require 'filemerger'

module Filemerger
  class CLI < Thor

    desc "Begins merging", "Checks if there are files and merges them"
    def merge
      Filemerger.begin_merge
    end

  end
end
