require 'pry'


class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs
    attr_reader 
    
    @@all = []

    def initialize(name) 
        @name = name
        @songs = []
        save
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def save
        @@all << self
    end

    def self.create(name)
        new_song = self.new(name)
    end

    def artists
        songs.map {|song| song.artist}.uniq
    end
end