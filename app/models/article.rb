class Article < ApplicationRecord
  belongs_to :genre

  has_many :songs

  attr_accessible :genre_id, :name, :genre
end
