class PlaylisterCLI

  @@on = true

  def self.parse_command(command)
    split_command = command.split
    self.send(split_command[0], *command.split[1])
  end

  def self.artists
    Artist.all.sort_by {|a| a.name}.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name} - #{artist.songs.size} Songs"
      artist.songs.sort_by {|s| s.name}.each do |song|
        puts "\t~ #{song.name} [#{song.genre.name}]"
      end
    end
  end

  def self.genres
    Genre.all.sort_by {|g| g.name}.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name} - #{genre.songs.size} Songs, #{genre.artists.size} Artists"
    end
  end

  def self.songs
    playlist
  end

  def self.playlist
    Song.all.sort_by {|s| s.artist.name}.each_with_index do |song, i|
      puts "#{i+1}. #{song.name} - #{song.artist.name} [#{song.genre.name}]"
    end
  end

  def self.browse(filter="all")
    case filter
    when "all"
      self.send("playlist")
    else
      self.send(filter)
    end
  end

  def self.method_missing(method, *args, &block)
    puts "Sorry, I don't understand. Type 'help' if you're confused."
  end

  def self.get_input
    print 'Enter command > '
    gets.downcase.strip
  end

  def self.run
    @@on = true
    puts "Welcome to Playlister-RB. Have fun, kids."
    while self.on?
      self.parse_command(self.get_input)
    end
  end

  def self.on?
    @@on
  end

  def self.help
    puts "Here's what you can do:"
    puts "'playlist' to see an overview of everything"
    puts "'browse <by>' where <by> is artist, genre, or song"
  end

  def self.exit
    @@on = false
  end

end