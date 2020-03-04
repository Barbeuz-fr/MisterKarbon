class Orga < ApplicationRecord
  belongs_to :company
  has_many :report_scope_orgas
  has_many :report_scopes, through: :report_scope_orgas
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_orga,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
