class ChangeAddressToAllStrings < ActiveRecord::Migration
  def change
    remove_column :addresses, :zip
    remove_column :addresses, :building_number

    add_column :addresses, :zip, :string
    add_column :addresses, :building_number, :string
  end
end
