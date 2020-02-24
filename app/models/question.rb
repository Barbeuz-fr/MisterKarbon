class Question < ApplicationRecord
  belongs_to :ademe_emission_factor
  belongs_to :emission_module
end
