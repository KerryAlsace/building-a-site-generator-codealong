class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_writer :songs
  
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def songs
    begin
      @songs.dup.freeze
    rescue RuntimeError
      puts "Use the #add_song method to add a song to an artist's collection"
    end
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

  def to_s
    self.name
  end

  def save
    @@all << self
  end
end
