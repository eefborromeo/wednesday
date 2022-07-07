class AddTransactionTotalToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :transaction_total, :decimal
  end
end
