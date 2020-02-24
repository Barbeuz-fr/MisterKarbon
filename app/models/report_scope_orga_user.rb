class ReportScopeOrgaUser < ApplicationRecord
  belongs_to :user
  belongs_to :report_scope_orga
end
