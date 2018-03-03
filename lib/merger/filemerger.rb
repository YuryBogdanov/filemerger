
module Merger
  class Filemerger
    def self.merge_files(first_file, second_file)
      first_content = File.readlines(first_file).join()
      second_content = File.readlines(second_file).join()

      result_content = first_content + "\n" + second_content

      save_to_file(result_content)
      delete_file_if_needed(first_file)
      delete_file_if_needed(second_file)
    end

    private

    def self.save_to_file(content)
      # save to new file
    end

    def self.delete_file_if_needed(file)
      # delete old files
    end
  end
end
