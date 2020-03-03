class EmissionModule < ApplicationRecord
  has_many :report_scopes
  has_many :questions
  has_one_attached :photo
end
