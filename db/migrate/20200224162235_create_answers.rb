class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :calculation
      t.references :question, null: false, foreign_key: true
      t.references :report_scope, null: false, foreign_key: true

      t.timestamps
    end
  end
end
