class AddColumnsToActivityData < ActiveRecord::Migration[6.0]
  def change

    # Activity_data attributes
    add_column :activity_data, :value_1, :float
    add_column :activity_data, :value_2, :float
    add_column :activity_data, :amount_spend, :float
    add_column :activity_data, :amount_unit, :string
    add_column :activity_data, :start_date, :datetime
    add_column :activity_data, :end_date, :datetime
    add_column :activity_data, :transport_payment, :string
    add_column :activity_data, :vehicle_control, :string
    add_column :activity_data, :beges_item, :integer

    # foreign keys
    add_reference :activity_data, :emission_factor, foreign_key: true


  end
end
