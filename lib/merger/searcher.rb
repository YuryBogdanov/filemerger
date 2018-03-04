require 'merger/poster'

module Merger
  class Searcher
    def self.find_files(masks)
      files = []
      masks.each do | mask |
        mask_files = Dir.glob("**/*#{mask}")
        files.push(mask_files)
        puts "Mask Files = #{mask_files}"
        Poster.post_search_completed(mask, mask_files.count)
      end
      puts "SEARCHING FILES! COMPLETE! #{files}"
      return files
    end

    def self.find_files_for_mask(mask)
      files = Dir.glob("**/*#{mask}")
      puts "FOUND FILES! #{files}"
      return files
    end
  end
end
