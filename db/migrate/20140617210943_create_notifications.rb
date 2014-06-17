class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :notifieable_id
      t.string :notifieable_type
      t.string :workflow_state

      t.timestamps
    end
  end
end
