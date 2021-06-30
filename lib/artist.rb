class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def print_songs
        puts self.songs.map {|song| song.name}
    end

    def self.find_or_create_by_name(name)
        artist = @@all.find {|artist| artist.name == name} || Artist.new(name)
        artist
    end
end