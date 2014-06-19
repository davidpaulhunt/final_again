class ChangeStat < ActiveRecord::Migration
  def change

    drop_table :stats

    create_table :sports do |t|
      t.string :name
      t.boolean :male, default: true
      t.boolean :female, default: true
    end

    create_table :stats do |t|
      t.belongs_to :sport
      t.string :name
    end

    create_table :player_stats do |t|
      t.belongs_to :player
      t.belongs_to :stat
      t.integer :value
    end

    add_column :positions, :sport_id, :integer

  end
end
