class RemoveCoach < ActiveRecord::Migration
  def change
    
    rename_table :users, :accounts

    create_table :players do |t|
      t.string :first_name
      t.string :last_name
    end

    add_column :accounts, :accountable_id, :integer
    add_column :accounts, :accountable_type, :string
    add_column :accounts, :location, :string
    add_column :accounts, :about, :text

    remove_column :accounts, :type

    add_column :schools, :web_url, :string

    remove_column :schools, :photo

    drop_table :coaching_positions

    rename_column :position_needs, :coach_id, :school_id

    drop_table :sports

    remove_column :positions, :sport_id

    remove_column :stats, :sport_id

  end
end
