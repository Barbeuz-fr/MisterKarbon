class CreateTestorgas < ActiveRecord::Migration[6.0]
  def change
    create_table :testorgas do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
