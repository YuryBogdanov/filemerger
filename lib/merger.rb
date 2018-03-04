require "merger/version"
require "merger/poster"
require "merger/searcher"
require "merger/filemerger"
require "json"

module Merger
  class Merger
    # What to do here:
    # 1. Post greeting
    # 2. Read user input (json)
    # 3. Post info (data acquired)
    # 4. Pass data found for files searching
    def self.begin_merge
      Poster.post_greeting
      puts "Searching for Mergefile.json in #{Dir.pwd}"
      file = File.read("Mergefile.json")
      data = JSON.parse(file)
      Poster.post_data_acquired

      found = Searcher.find_files_for_mask(data["patterns"].first)

      found.each do |file|
        file_name = File.basename(file).to_s.chomp(data["patterns"].first)
        puts "FILE NAME #{file_name}"
        puts "Sec Pattern #{data["patterns"][1]}"
        second_file = File.dirname(file) + "/" + file_name + data["patterns"][1]

        if File.exist?(second_file)
          first_text = File.readlines(file).join()
          second_text = File.readlines(second_file).join()
          new_content = first_text + "\n" + second_text
          puts "Result pattern #{data["result_pattern"]}"
          new_file_name = File.dirname(file) + "/" + file_name + data["result_pattern"]
          File.open(new_file_name, "w") { |f| f.puts new_content }
          puts "❇️  File #{new_file_name} created"
        end
      end
    end
  end
end
