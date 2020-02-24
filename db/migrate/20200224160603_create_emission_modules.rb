class CreateEmissionModules < ActiveRecord::Migration[6.0]
  def change
    create_table :emission_modules do |t|
      t.string :name

      t.timestamps
    end
  end
end
