class RemoveUserFromCompanies < ActiveRecord::Migration[6.0]
  def change
    remove_reference :companies, :user, null: false, foreign_key: true
  end
end
