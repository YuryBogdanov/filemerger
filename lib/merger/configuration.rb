
module Merger
  class Configuration
    attr_reader :masks, :result_mask, :delete_old_files

    def initialize(data)
      @masks = data["masks"]
      @result_mask = data["result_mask"]
      @delete_old_files = data["delete_old_files"]
    end
  end
end
