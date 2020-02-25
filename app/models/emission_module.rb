class EmissionModule < ApplicationRecord
  has_many :report_scopes
  has_many :questions
end
