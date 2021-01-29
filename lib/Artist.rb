require 'pry'


class Artist
    extend Concerns::Findable
    # include Findable
    attr_accessor :name, :songs
    attr_reader :genre
    
    @@all = []

    def initialize(name, songs=nil) 
        @name = name
        songs == nil ? @songs = [] : @songs = [songs]
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

    def add_song(song)
        song.artist ? nil : song.artist = self
        self.songs.include?(song) ? nil : self.songs << song
    end

    def genres
        songs.map {|song| song.genre}.uniq
    end
end