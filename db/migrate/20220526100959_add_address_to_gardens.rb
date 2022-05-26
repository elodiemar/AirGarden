class AddAddressToGardens < ActiveRecord::Migration[7.0]
  def change
    add_column :gardens, :address, :string
  end
end
