class ReportScopeOrgaUser < ApplicationRecord
  belongs_to :user
  has_many :report_scope_orgas
end
