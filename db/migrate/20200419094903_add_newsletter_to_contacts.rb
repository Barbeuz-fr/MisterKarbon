class AddNewsletterToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :newsletter, :boolean
  end
end
