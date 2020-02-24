class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.boolean :calculation
      t.string :content
      t.references :ademe_emission_factor, null: false, foreign_key: true
      t.references :emission_module, null: false, foreign_key: true

      t.timestamps
    end
  end
end
