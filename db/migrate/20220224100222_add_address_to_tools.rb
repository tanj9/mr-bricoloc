class AddAddressToTools < ActiveRecord::Migration[6.1]
  def change
    add_column :tools, :address, :string
  end
end
