class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :sport_id
      t.string :name

      t.timestamps
    end

    create_table :positions_users do |t|
      t.integer :position_id
      t.integer :user_id

      t.timestamps
    end

  end
end
