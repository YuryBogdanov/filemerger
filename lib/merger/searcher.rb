require 'merger/poster'

module Merger
  # Rename this class into Searcher
  # This class should only search for files
  # Create another one, which will be named Filemerger
  # This class should only merge files
  class Searcher
    def self.find_files(masks)
      first_files = Dir.glob("**/#{masks.first}")
      Poster.post_search_completed(masks.first, first_files.count)
    end
  end
end
