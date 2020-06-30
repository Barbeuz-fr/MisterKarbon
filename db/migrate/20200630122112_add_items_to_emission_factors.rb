class AddItemsToEmissionFactors < ActiveRecord::Migration[6.0]
  def change

    # Localization
    add_column :emission_factors, :localization_1, :string
    add_column :emission_factors, :localization_2, :string

    # Booleans for operational data
    add_column :emission_factors, :item_1_fixed_energy, :boolean
    add_column :emission_factors, :item_2_electricity, :boolean
    add_column :emission_factors, :item_3_network, :boolean
    add_column :emission_factors, :item_4_mobile_fuel, :boolean
    add_column :emission_factors, :item_5_transport, :boolean
    add_column :emission_factors, :item_6_business_travel, :boolean
    add_column :emission_factors, :item_7_commuting, :boolean
    add_column :emission_factors, :item_8_client_visits, :boolean
    add_column :emission_factors, :item_9_procurement, :boolean
    add_column :emission_factors, :item_10_amortization, :boolean
    add_column :emission_factors, :item_11_waste_city, :boolean
    add_column :emission_factors, :item_12_waste_private, :boolean
    add_column :emission_factors, :item_13_water, :boolean
    add_column :emission_factors, :item_14_product_use, :boolean
    add_column :emission_factors, :item_15_product_waste, :boolean
    add_column :emission_factors, :item_16_fugitive, :boolean
  end
end
