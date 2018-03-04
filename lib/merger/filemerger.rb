require 'merger/poster'
require 'merger/searcher'

module Merger
  class Filemerger
    def self.merge_files(config)
      first_mask_files = Searcher.find_files_for_mask(config.masks.first)

      if first_mask_files.count == 0
        Poster.post_nothing_found
        exit
      end

      first_mask_files.each do |first_mask_file|
        file_name = File.basename(first_mask_file).to_s.chomp(config.masks.first)
        content = ""
        config.masks.each do |mask|
          file = File.dirname(first_mask_file) + "/" + file_name + mask
          if File.exist?(file)
            content += File.readlines(file).join() + "\n"
            delete_file_if_needed(file, config)
          else
            Poster.post_file_not_found(file)
          end
        end

        new_file_name = File.dirname(first_mask_file) + "/" + file_name + config.result_mask
        File.open(new_file_name, "w") { |f| f.puts content }
        Poster.post_file_created(new_file_name)
      end
      Poster.post_merge_finished
    end

    private

    def self.delete_file_if_needed(file, config)
      if config.delete_old_files
        File.delete(file)
      end
    end
  end
end
