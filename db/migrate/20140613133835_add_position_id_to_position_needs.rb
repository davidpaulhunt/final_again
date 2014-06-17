class AddPositionIdToPositionNeeds < ActiveRecord::Migration
  def change
    add_column :position_needs, :position_id, :integer
  end
end
