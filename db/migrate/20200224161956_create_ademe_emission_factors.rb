class CreateAdemeEmissionFactors < ActiveRecord::Migration[6.0]
  def change
    create_table :ademe_emission_factors do |t|
      t.string :name
      t.float :emission_value
      t.string :unit

      t.timestamps
    end
  end
end
