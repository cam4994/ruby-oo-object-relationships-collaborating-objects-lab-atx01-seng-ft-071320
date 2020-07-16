class MP3Importer 
    attr_accessor :path
    def initialize(path)
        @path = path 
        @filenames = @path 
        @filenames +="/*"
    end
    
    def files 
        all_files = Dir[@filenames]
        all_files.each do |file|
            file[0,21]= ""
        end 
    end 

    def import
        all_files = self.files 
        all_files.each do |file|
            Song.new_by_filename(file)
        end
    end 

end 