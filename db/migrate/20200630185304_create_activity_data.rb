class CreateActivityData < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_data do |t|

      t.timestamps
    end
  end
end
