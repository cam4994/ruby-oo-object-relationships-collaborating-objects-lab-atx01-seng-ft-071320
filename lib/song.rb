class Song 
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name 
        self.class.all << self 
    end 

    def self.all 
        @@all 
    end 

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

    def self.new_by_filename(filename)
        name = filename.split(" - ")[1]
        artist = filename.split(" - ")[0]
        song = self.new(name)
        song.artist = Artist.find_or_create_by_name(artist)
        song
    end 

end 