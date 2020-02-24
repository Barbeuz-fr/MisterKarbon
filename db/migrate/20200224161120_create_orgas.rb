class CreateOrgas < ActiveRecord::Migration[6.0]
  def change
    create_table :orgas do |t|
      t.string :name
      t.string :countries
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
