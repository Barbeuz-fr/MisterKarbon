class Orga < ApplicationRecord
  belongs_to :company
  has_many :report_scope_orgas
end
