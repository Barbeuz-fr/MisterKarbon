class AddDescriptionToEmissionModules < ActiveRecord::Migration[6.0]
  def change
    add_column :emission_modules, :general_description, :string
    add_column :emission_modules, :emission_factor_description, :string
  end
end
