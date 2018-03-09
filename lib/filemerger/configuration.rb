require 'yaml'
require 'filemerger/poster'

module Filemerger
  class Configuration
    attr_reader :masks, :result_mask, :delete_old_files, :working_folders, :ommit_lines, :xcode_project, :xcode_targets

    def initialize
      Poster.post_configuration_search

      if File.exist?("Mergefile.yaml")
        Poster.post_configuration_found
        data = YAML.load_file("Mergefile.yaml")

        @masks = data["masks"]
        @result_mask = data["result_mask"]
        @delete_old_files = data["delete_old_files"]
        @working_folders = data["working_folders"]
        @ommit_lines = data["ommit_lines"]
        @xcode_project = data["xcode_project"]
        @xcode_targets = data["xcode_targets"]
        @ommit_lines = data["ommit_lines"]
      else
        Poster.post_configuration_not_found
        exit
      end
    end
  end
end
