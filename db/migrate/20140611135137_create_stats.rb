class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|

      t.integer :user_id, default: 0
      t.integer :sport_id, default: 0

      t.integer :passing_yards, default: 0
      t.integer :passing_attempts, default: 0
      t.integer :passing_completions, default: 0
      t.integer :passing_touchdowns, default: 0
      t.integer :passing_interceptions, default: 0

      t.integer :rushing_yards, default: 0
      t.integer :rushing_attempts, default: 0
      t.integer :rushing_touchdowns, default: 0

      t.integer :receiving_yards, default: 0
      t.integer :receiving_receptions, default: 0
      t.integer :receiving_touchdowns, default: 0

      t.integer :defensive_tackles, default: 0
      t.integer :defensive_interceptions, default: 0
      t.integer :defensive_sacks, default: 0
      t.integer :defensive_touchdowns, default: 0

      t.integer :year

      t.timestamps
    end
  end
end
