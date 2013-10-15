require_relative '../../config/environment'

# Action Bronson - Larry Csonka [indie].mp3

["Action Bronson", "Larry Csonka [indie]"]
["Larry Csonka", "indie]"]


class LibraryParser

  def self.call
    Dir.foreach("#{ProjectRoot}/db/data").collect do |file|
      next if file.start_with?('.')
      split_song_info(file.gsub('.mp3',''))
    end.compact
  end

  def self.split_song_info(file)
    split = file.split(' - ')
    artist = split[0]
    song = split[1].split(' [')[0]
    genre = split[1].match(/(?<=\[).+?(?=\])/).to_s
    [artist, song, genre]
  end

end

ap LibraryParser.call