
module Merger
  class Configuration
    attr_reader :masks, :result_mask, :delete_old_files

    def initialize
      puts "Searching for Mergefile.json in #{Dir.pwd}"

      if File.exist?("Mergefile.json")
        file_data = File.read("Mergefile.json")
        data = JSON.parse(file_data)

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
