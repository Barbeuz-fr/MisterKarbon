class CreateEmissionFactors < ActiveRecord::Migration[6.0]
  def change
    create_table :emission_factors do |t|
      t.string :source
      t.integer :id_base_carbone
      t.string :line_type
      t.string :step
      t.string :ef_level_1
      t.string :ef_level_2
      t.string :ef_level_3
      t.float :ef_value_total
      t.float :ef_value_co2
      t.float :ef_value_ch4
      t.float :ef_value_n2o
      t.float :ef_value_co2b
      t.string :ef_value_ch4b
      t.float :ef_value_other_ges
      t.integer :ef_uncertainty
      t.string :ef_unit
      t.string :data_unit_1
      t.string :data_unit_2

      t.timestamps
    end
  end
end
