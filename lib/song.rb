class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
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
    @@all.detect {|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|word| word.name}
  end

  def self.new_from_filename(name)
    song = self.new
    song.name = name.split(" - ").last.sub(/\.[^.]+\z/, '')
    song.artist_name = name.split(" - ").first
    song
  end

  def self.create_from_filename(name)
    song = self.new
    song.name = name.split(" - ").last.sub(/\.[^.]+\z/, '')
    song.artist_name = name.split(" - ").first
    song
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
