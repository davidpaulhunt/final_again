class AddColumnToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :abbreviation, :string
  end
end
