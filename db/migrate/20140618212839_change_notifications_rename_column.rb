class ChangeNotificationsRenameColumn < ActiveRecord::Migration
  def change
    rename_column :notifications, :user_id, :account_id
  end
end
