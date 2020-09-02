class AddStateToPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :status, :integer
  end
end
