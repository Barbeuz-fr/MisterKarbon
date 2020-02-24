class AddEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :job_position, :string
    add_column :users, :organization_position, :string
  end
end
