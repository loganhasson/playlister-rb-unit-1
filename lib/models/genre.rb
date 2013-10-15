require_relative '../../config/environment'

class Genre

  extend Existable

  attr_accessor :name, :songs, :artists

  @@all = []

  def initialize
    @songs = []
    @artists = []
    @@all << self
  end

  def self.count
    @@all.count
  end

  def self.all
    @@all
  end

  def self.reset_genres
    @@all.clear
  end

  def self.genres
    all
  end

end