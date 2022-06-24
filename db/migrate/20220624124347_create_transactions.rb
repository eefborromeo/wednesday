class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|

      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.references :asset, null: false, foreign_key: true
    end
  end
end
