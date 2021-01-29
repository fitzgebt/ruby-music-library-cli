require 'pry'


class Song
    attr_accessor :name, :genre
    attr_reader :artist

    
    @@all = []

    def initialize(name, artist = nil, genre = nil) 
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
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
        new_song.save
        new_song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
    
    def genre=(genre)
        @genre = genre
        genre.songs.include?(self) ? nil : genre.songs << self
    end

    def self.find_by_name(name)
        self.all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end

    def self.new_from_filename(filename)
        song = Song.new(filename.split(" - ")[1])
 
        temp = Artist.find_or_create_by_name(filename.split(" - ")[0])
        song.artist = temp
        temp2 = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
        song.genre = temp2
        song
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end
end
