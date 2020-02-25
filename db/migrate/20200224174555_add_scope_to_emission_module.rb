class AddScopeToEmissionModule < ActiveRecord::Migration[6.0]
  def change
    add_column :emission_modules, :scope, :string
  end
end
