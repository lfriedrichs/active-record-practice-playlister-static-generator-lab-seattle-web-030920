class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def to_slug 
        self.name.split(" ").map {|word|
            word.downcase()
        }.join('-')
    end
end