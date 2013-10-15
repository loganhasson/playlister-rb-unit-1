require_relative '../../config/environment'

class Artist

  extend Existable

  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize
    @@all << self
    @songs = []
    @genres = []
  end

  def genre_has_artist?(genre)
    genre && !genre.artists.include?(self)
  end

  def add_song(song)
    self.songs << song
    self.genres << song.genre if !self.genres.include?(song.genre)
    song.artist = self
    if genre_has_artist?(song.genre)
      song.genre.artists << self
    end
  end

  def self.reset_artists
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.count
    all.count
  end

end