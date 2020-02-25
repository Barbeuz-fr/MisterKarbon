class ReportScopeOrga < ApplicationRecord
  belongs_to :orga
  belongs_to :report_scope
  has_many :emission_modules, through: :report_scope
end
