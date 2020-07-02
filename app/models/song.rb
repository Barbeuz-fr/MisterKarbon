class Song < ApplicationRecord
  belongs_to :artist

  # attr_accessible :artist_id, :title, :artist

end
