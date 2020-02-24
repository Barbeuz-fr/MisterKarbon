class CreateReportScopeOrgaUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :report_scope_orga_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :report_scope_orga, null: false, foreign_key: true

      t.timestamps
    end
  end
end
