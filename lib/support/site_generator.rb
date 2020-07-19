class SiteGenerator < ActiveRecord::Base

    def initialize(url)
        @url = url 
    end

    def rendered_path 
        @url
    end

    def build_index 

    end

    def build_artists_index 

    end

    def build_genres_index 

    end

    def build_songs_index 

    end

    def build_song_page

    end

    def build_artist_page

    end

    def build_genre_page

    end

    def generate 

    end
end