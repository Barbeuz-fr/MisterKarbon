class EditColumnsToEmissionFactors < ActiveRecord::Migration[6.0]
  def change
    remove_column :emission_factors, :ef_value_ch4b
    add_column :emission_factors, :ef_value_ch4b, :float
  end
end
