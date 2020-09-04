class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :account_id
      t.float :amount_in_cents
      t.string :currency
      t.string :pusrpose

      t.timestamps
    end
  end
end
