require_relative '../../config/environment'

class Song

  extend Existable

  attr_accessor :name, :artist
  attr_reader :genre, :artist

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

end