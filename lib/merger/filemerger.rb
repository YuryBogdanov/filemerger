require 'merger/poster'

module Merger
  class Filemerger
    def self.merge_files(first_file, second_file)
      puts "FILE! #{first_file} | CLASS! #{first_file.class}"
      # first_content = File.readlines(first_file).join()
      # second_content = File.readlines(second_file).join()

      # result_content = first_content + "\n" + second_content
      #
      # save_to_file(result_content)
      # delete_file_if_needed(first_file)
      # delete_file_if_needed(second_file)
    end

    private

    def self.save_to_file(content)
      File.open("output_file", "w") { |f| f.puts content }
      Poster.post_created_file("output_file")
    end

    def self.delete_file_if_needed(file)
      # delete old files
    end
  end
end
