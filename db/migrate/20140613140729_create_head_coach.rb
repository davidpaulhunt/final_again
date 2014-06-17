class CreateHeadCoach < ActiveRecord::Migration
  def change
    create_table :coaching_positions do |t|
      t.belongs_to :coach
      t.belongs_to :school
    end
  end
end
