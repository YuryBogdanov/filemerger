require 'merger/poster'

module Merger
  # Rename this class into Searcher
  # This class should only search for files
  # Create another one, which will be named Filemerger
  # This class should only merge files
  class Searcher
    def self.find_files(masks)
      files = []
      masks.each do | mask |
        mask_files = Dir.glob("**/#{mask}")
        files.push(mask_files)
        puts "Mask Files = #{mask_files}"
        Poster.post_search_completed(mask, mask_files.count)
      end
      files
    end
  end
end
