class CreateReportScopeOrgas < ActiveRecord::Migration[6.0]
  def change
    create_table :report_scope_orgas do |t|
      t.references :orga, null: false, foreign_key: true
      t.references :report_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
