require 'thor'
require 'filemerger'

module Filemerger
  class CLI < Thor

    desc "Begins merging", "Checks if there are files and merges them"
    def merge
      Filemerger.begin_merge
    end

    desc "Creates mergefile", "Creates mergefile for Filemerger setup"
    def setup
      Filemerger.setup
    end

  end
end
