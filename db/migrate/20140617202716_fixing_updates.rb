class FixingUpdates < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.belongs_to :player
      t.string :title
      t.string :panda_video_id
    end

    add_column :schools, :photo, :string

    create_table :favorite_schools do |t|
      t.belongs_to :player
      t.belongs_to :school
    end
  end
end
