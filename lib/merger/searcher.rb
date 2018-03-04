require 'merger/poster'

module Merger
  class Searcher
    def self.find_files(masks)
      files = []
      masks.each do | mask |
        mask_files = Dir.glob("**/*#{mask}")
        files.push(mask_files)
        Poster.post_search_completed(mask, mask_files.count)
      end
      return files
    end

    def self.find_files_for_mask(mask)
      files = Dir.glob("**/*#{mask}")
      return files
    end
  end
end
