class RemoveStatusFromReportScope < ActiveRecord::Migration[6.0]
  def change
    remove_column :report_scopes, :status, :string
  end
end
