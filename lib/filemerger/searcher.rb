require 'filemerger/poster'

module Filemerger
  class Searcher
    def self.find_files_for_mask(mask, folders)
      unless folders.nil? || folders.empty?
        files_for_merge = []
        folders.each do |folder|
          Poster.post_search_files("#{folder}/*#{mask}")
          files_for_mask = Dir.glob("#{folder}/*#{mask}")
          files_for_merge += files_for_mask
        end
        return files_for_merge
      else
        Poster.post_default_searching_path
        files = Dir.glob("**/*#{mask}")
        return files
      end
    end
  end
end
