class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if(song == nil)
      song = self.create_by_name(name)
    end
      song
  end

  def self.alphabetical
    @@all.sort{|a,b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    data = filename.split(' - ')
    song.artist_name = data[0]
    fullTitle = data[1].split('.')
    songTitle = fullTitle[0]
    song.name = songTitle
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end
