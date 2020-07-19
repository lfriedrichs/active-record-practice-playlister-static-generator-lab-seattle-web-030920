  
class Song < ActiveRecord::Base
belongs_to :artist
belongs_to :genre

def to_slug 
    self.name.split(" ").map {|word|
        word.downcase()
    }.join('-')
end
end