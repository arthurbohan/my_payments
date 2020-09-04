class AddStatusToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :approved_at, :datetime
    add_column :payments, :executed_at, :datetime
    add_column :payments, :declined_at, :datetime
  end
end
