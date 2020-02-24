class AddEmissionModuleToReportScopes < ActiveRecord::Migration[6.0]
  def change
    add_reference :report_scopes, :emission_module, null: false, foreign_key: true
  end
end
