class ReportScopeOrga < ApplicationRecord
  belongs_to :orga
  belongs_to :report_scope
  has_many :answers
  has_many :report_scope_orga_users
end
