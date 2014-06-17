class ChangeItAll < ActiveRecord::Migration
  def change

    drop_table :addresses
    drop_table :conferences
    drop_table :favorites

    remove_column :schools, :conference_id

    remove_column :users, :birthday
  end
end
