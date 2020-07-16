class Artist 
    attr_accessor :name 
    @@all = []

    def initialize(name)
        @name = name 
        self.class.all << self 
    end 

    def self.all 
        @@all
    end 

    def songs 
        Song.all.select do |song|
            song.artist == self 
        end 
    end 

    def add_song(song)
        song.artist = self 

    end 

    def print_songs
        songs.each do |song|
            puts song.name 
        end 
    end 

    def self.find_or_create_by_name(name)
        x = nil 
        x = @@all.find do |artist|
            artist.name == name 
        end 
        if !!x 
            x 
        else 
            Artist.new(name)
        end 
    end 

end 