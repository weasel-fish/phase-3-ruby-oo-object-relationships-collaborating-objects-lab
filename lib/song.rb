class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        arr = file_name.split " - "
        artist = arr[0]
        title = arr[1]
        song = self.new(title)
        song.artist_name = artist
        song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
end