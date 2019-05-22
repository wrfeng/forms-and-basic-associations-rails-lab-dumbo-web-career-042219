class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents
    arr = self.notes.map {|note| note.content}
    arr.select {|ele| !ele.empty?}
  end

  def note_contents=(contents)

    contents.each do |content|
      self.notes << Note.create(content: content)
    end
  end
end
