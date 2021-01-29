#  "./spec/fixtures/mp3s"


class MusicImporter
    attr_accessor :path


    def initialize(path)
        @path = path
    end

    def files
        clean_files = []
        x = Dir.entries(path)
        x.reject{|x| x == "." || x == ".."}.each do |file|
            clean_files << file
        end
        clean_files
    end

    def import
        files.each {|mp3| Song.create_from_filename(mp3)}
    end
end