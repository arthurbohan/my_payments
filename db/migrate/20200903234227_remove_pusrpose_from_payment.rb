class RemovePusrposeFromPayment < ActiveRecord::Migration[6.0]
  def change
    remove_column :payments, :pusrpose, :string
  end
end
