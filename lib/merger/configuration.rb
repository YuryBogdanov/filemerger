require 'yaml'
require 'merger/poster'

module Merger
  class Configuration
    attr_reader :masks, :result_mask, :delete_old_files

    def initialize
      Poster.post_configuration_search

      if File.exist?("Mergefile.yaml")
        Poster.post_configuration_found
        data = YAML.load_file("Mergefile.yaml")

        @masks = data["masks"]
        @result_mask = data["result_mask"]
        @delete_old_files = data["delete_old_files"]
      else
        Poster.post_configuration_not_found
        exit
      end
    end
  end
end
