class ReportScope < ApplicationRecord
  belongs_to :report
  belongs_to :emission_module
  has_many :report_scope_orgas
  has_many :answers

  def to_s
    emission_module.name
  end
end
