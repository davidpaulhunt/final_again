class AddJoinTableForPlayersPositions < ActiveRecord::Migration
  def change
    drop_table :positions_users

    create_table :players_positions do |t|
      t.integer "player_id"
      t.integer  "position_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
