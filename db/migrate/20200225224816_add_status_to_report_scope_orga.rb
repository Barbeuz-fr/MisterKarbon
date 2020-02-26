class AddStatusToReportScopeOrga < ActiveRecord::Migration[6.0]
  def change
    add_column :report_scope_orgas, :status, :string
  end
end
