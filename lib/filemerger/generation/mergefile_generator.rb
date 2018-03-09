require 'filemerger/poster'

module Filemerger
  class MergefileGenerator
    def self.generate
      file_contents = IO.read(File.dirname(__FILE__) + '/mergefile.template')
      File.open('Mergefile', 'w+') { |file| file.write(file_contents) }
      Poster.post_mergefile_generated
    end
  end
end
