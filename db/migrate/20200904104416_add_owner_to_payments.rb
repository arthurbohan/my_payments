class AddOwnerToPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :owner, :integer
  end
end
