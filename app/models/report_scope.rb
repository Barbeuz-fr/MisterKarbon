class ReportScope < ApplicationRecord
  belongs_to :report
  belongs_to :emission_module
  has_many :report_scope_orgas, dependent: :destroy
  has_many :answers, dependent: :destroy
  validates_uniqueness_of :report_id, scope: :emission_module_id
end
