require 'pry'
class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""

    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip
    end
  end

  def list_songs
    a = Song.all.sort{ |a, b| a.name <=> b.name }
    a.each.with_index(1) do |song, num|
      puts "#{num}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
      a = Artist.all.sort{ |a, b| a.name <=> b.name }
      a.each.with_index(1) do |art, num|
      puts "#{num}. #{art.name}"
    end
  end

  def list_genres
      a = Genre.all.sort{ |a, b| a.name <=> b.name }
      a.each.with_index(1) do |gen, num|
      puts "#{num}. #{gen.name}"
    end
  end

  def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.strip

      if artist = Artist.find_by_name(input)
        artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |song, num|
          puts "#{num}. #{song.name} - #{song.genre.name}"
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input = gets.strip

      if genre = Genre.find_by_name(input)
        genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |song, num|
          puts "#{num}. #{song.artist.name} - #{song.name}"
        end
      end
    end

    def play_song

    end
end
