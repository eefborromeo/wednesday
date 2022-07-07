class AddMoneyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :money, :decimal, default: 10000
  end
end
