class AddUnitsToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :unit, :string
  end
end
