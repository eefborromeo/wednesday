class AddTotalSharesToAsset < ActiveRecord::Migration[6.1]
  def change
    add_column :assets, :total_shares, :float
  end
end
