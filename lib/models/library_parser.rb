# the instructions seem to indicate we don't use
# any require or require_relative statements here
require_relative '../../config/environment'

# Action Bronson - Larry Csonka [indie].mp3

["Action Bronson", "Larry Csonka [indie]"]
["Larry Csonka", "indie]"]


class LibraryParser

  def self.make_objects(song_info_array)
    a = Artist.exists?(song_info_array[0]) || Artist.new.tap {|a| a.name = song_info_array[0]}
    g = Genre.exists?(song_info_array[2]) || Genre.new.tap {|g| g.name = song_info_array[2]}
    s = Song.new.tap do |s|
      s.name = song_info_array[1]
      s.genre = g
    end
    a.add_song(s)
  end

  def self.call
    Dir.foreach("#{ProjectRoot}/db/data").each do |file|
      next if file.start_with?('.')
      song_info = split_song_info(file.gsub('.mp3',''))
      make_objects(song_info) if song_info != nil
    end
  end

  def self.split_song_info(file)
    split = file.split(' - ')
    artist = split[0]
    song = split[1].split(' [')[0]
    genre = split[1].match(/(?<=\[).+?(?=\])/).to_s
    [artist, song, genre]
  end

end