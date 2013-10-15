require_relative 'spec_helper.rb'

describe "Song" do

  let(:song) { Song.new }

  it "can initialize a song" do
    song.should be_a(Song)
  end

  it "can have a name" do
    song.name = "Jump Around"
    song.name.should eq("Jump Around")
  end

  it "can have a genre" do
    song.genre = Genre.new.tap {|g| g.name = "rap"}
    song.genre.name.should eq("rap")
    song.genre.should be_a(Genre)
  end

  it "has an artist" do
    song.artist = Artist.new.tap {|a| a.name = "miley"}
    song.artist.should be_a(Artist)
    song.artist.name.should eq("miley")
  end
end
