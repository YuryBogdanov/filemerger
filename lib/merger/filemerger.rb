require 'merger/poster'

module Merger
  class Filemerger
    def self.find_files(masks)
      first_files = Dir.glob("**/#{masks.first}")
      Poster.post_search_completed(masks.first, first_files.count)
    end
  end
end
