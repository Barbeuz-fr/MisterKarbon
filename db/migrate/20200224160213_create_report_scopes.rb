class CreateReportScopes < ActiveRecord::Migration[6.0]
  def change
    create_table :report_scopes do |t|
      t.date :deadline
      t.string :status
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
