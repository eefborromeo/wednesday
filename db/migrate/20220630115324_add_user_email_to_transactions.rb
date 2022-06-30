class AddUserEmailToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :user_email, :string, null: false
  end
end
