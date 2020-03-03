class Orga < ApplicationRecord
  belongs_to :company
  has_many :report_scope_orgas
  has_many :report_scopes, through: :report_scope_orgas
  # has_one_attached :photo
end
