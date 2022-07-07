class AddColumnsToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :company_name, :string
    add_column :transactions, :asset_id, :bigint
    add_column :transactions, :asset_name, :string
    add_column :transactions, :asset_price, :decimal
    add_column :transactions, :shares, :decimal
    add_column :transactions, :transaction_type, :string
  end
end
