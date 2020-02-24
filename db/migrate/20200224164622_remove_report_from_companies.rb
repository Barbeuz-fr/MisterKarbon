class RemoveReportFromCompanies < ActiveRecord::Migration[6.0]
  def change
    remove_reference :companies, :report, null: false, foreign_key: true
  end
end
