class AddColumnsToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :company_name, :string
    add_column :transactions, :asset_name, :string
    add_column :transactions, :asset_price, :float
    add_column :transactions, :shares, :float
    add_column :transactions, :transaction_type, :string
  end
end
