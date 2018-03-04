require 'yaml'

module Merger
  class Configuration
    attr_reader :masks, :result_mask, :delete_old_files

    def initialize
      puts "Searching for Mergefile.yaml in #{Dir.pwd}"

      if File.exist?("Mergefile.yaml")
        data = YAML.load_file("Mergefile.yaml")
        puts "YAML #{data}"
        @masks = data["masks"]
        @result_mask = data["result_mask"]
        @delete_old_files = data["delete_old_files"]
      else
        puts "Couldn't locate configuration file"
        exit
      end
    end
  end
end
