class Question < ApplicationRecord
  belongs_to :ademe_emission_factor
  belongs_to :emission_module
  has_many :answers
  has_many :report_scopes, through: :answers
end
