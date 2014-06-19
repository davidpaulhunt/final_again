class RemoveColumnFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :first_name
    remove_column :accounts, :last_name
  end
end
