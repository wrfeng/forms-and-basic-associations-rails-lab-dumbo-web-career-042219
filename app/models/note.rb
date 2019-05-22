class Note < ActiveRecord::Base
  belongs_to :song

  def note_contents
    self.content
  end
end
