require 'filemerger/poster'

module Filemerger
  class Searcher
    def self.find_files_for_mask(mask, folders)
      files_for_merge = []
      folders.each do |folder|
        Poster.post_search_files("#{folder}/*#{mask}")
        files_for_mask = Dir.glob("#{folder}/*#{mask}")
        files_for_merge += files_for_mask
      end
      return files_for_merge
    end
  end
end
