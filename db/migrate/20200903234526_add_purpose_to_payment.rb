class AddPurposeToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :purpose, :string
  end
end
