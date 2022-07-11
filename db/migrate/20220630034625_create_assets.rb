class CreateAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :assets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :asset_name, null: false

      t.timestamps
    end
  end
end
