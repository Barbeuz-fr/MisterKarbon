class Company < ApplicationRecord
  has_many :users
  has_many :reports
  has_many :orgas

  include PgSearch::Model
  multisearchable against: [:name]
end
