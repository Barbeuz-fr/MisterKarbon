class AddCompanyToReports < ActiveRecord::Migration[6.0]
  def change
    add_reference :reports, :company, null: false, foreign_key: true
  end
end
