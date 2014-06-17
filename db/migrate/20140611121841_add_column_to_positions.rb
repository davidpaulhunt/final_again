class AddColumnToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :abbreviation, :string
  end
end
