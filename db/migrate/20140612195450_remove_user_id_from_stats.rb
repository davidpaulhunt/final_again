class RemoveUserIdFromStats < ActiveRecord::Migration
  def change
    remove_column :stats, :user_id
    add_column :stats, :player_id, :integer
  end
end
