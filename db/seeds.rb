# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin = User.create(
  email: 'wednestrade-admin@wednestrade.com',
  password: 'wedtrade',
  password_confirmation: 'wedtrade',
  admin: true,
  approved: true,
  money: 0
)

admin.skip_confirmation!
admin.save

trader1 = User.create(
  email: 'wednestrade-trader1@wednestrade.com',
  password: 'wedtrade',
  password_confirmation: 'wedtrade',
  admin: false,
  approved: true,
  money: 10000
)

trader1.skip_confirmation!
trader1.save

trader2 = User.create(
  email: 'wednestrade-trader2@wednestrade.com',
  password: 'wedtrade',
  password_confirmation: 'wedtrade',
  admin: false,
  approved: false,
  money: 0
)

trader2.skip_confirmation!
trader2.save

trader1asset1 = Asset.create(
  user_id: trader1.id,
  asset_name: 'JBFCF',
  total_shares: 5.0
)

trader1asset2 = Asset.create(
  user_id: trader1.id,
  asset_name: 'MSFT',
  total_shares: 0
)

trader2asset1 = Asset.create(
  user_id: trader2.id,
  asset_name: 'MSFT',
  total_shares: 0.5
)

Transaction.create(
  user_id: trader1.id,
  user_email: trader1.email,
  asset_id: trader1asset1.id,
  asset_name: 'JBFCF',
  company_name: 'Jollibee Foods Corp.',
  asset_price: 201.0,
  shares: 5.0,
  transaction_total: 1005.0,
  transaction_type: 'buy'
)

Transaction.create(
  user_id: trader2.id,
  user_email: trader2.email,
  asset_id: trader2asset1.id,
  asset_name: 'MSFT',
  company_name: 'Microsoft Corporation',
  asset_price: 421.0,
  shares: 0.5,
  transaction_total: 210.5,
  transaction_type: 'buy'
)