class CreatePositionNeeds < ActiveRecord::Migration
  def change
    create_table :position_needs do |t|
      t.string :name
      t.integer :coach_id

      t.timestamps
    end
  end
end
