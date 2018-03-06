require 'filemerger/poster'

module Filemerger
  class Searcher
    def self.find_files_for_mask(mask)
      files = Dir.glob("**/*#{mask}")
      return files
    end
  end
end
