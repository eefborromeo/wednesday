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
  username: 'admin',
  first_name: 'wednesday',
  last_name: 'trade',
  admin: true,
  approved: true,
  money: 0.0
)

admin.skip_confirmation!
admin.save

trader1 = User.create(
  email: 'wednestrade-trader1@wednestrade.com',
  password: 'wedtrade',
  password_confirmation: 'wedtrade',
  username: 'Rusk',
  first_name: 'Lance Kennard',
  last_name: 'Pallarca',
  approved: true,
  money: 100000.0
)

trader1.skip_confirmation!
trader1.created_at = (rand*10).days.ago
trader1.save

trader2 = User.create(
  email: 'wednestrade-trader2@wednestrade.com',
  password: 'wedtrade',
  password_confirmation: 'wedtrade',
  username: 'Mel',
  first_name: 'Eloisa',
  last_name: 'Borromeo',
  approved: true,
  money: 0.0
)

trader2.skip_confirmation!
trader2.created_at = (rand*10).days.ago
trader2.save

trader3 = User.create(
  email: Faker::Internet.unique.email,
  password: "wedtrade",
  password_confirmation: 'wedtrade',
  username: Faker::Internet.unique.username(specifier: 1...15),
  first_name: Faker::Name.unique.first_name,
  last_name: Faker::Name.unique.last_name,
  approved: [true, false].sample,
  money: Faker::Number.decimal(l_digits: 5, r_digits: 2)
)

trader3.skip_confirmation!
trader3.created_at = (rand*10).days.ago
trader3.save

trader4 = User.create(
  email: Faker::Internet.unique.email,
  password: "wedtrade",
  password_confirmation: 'wedtrade',
  username: Faker::Internet.unique.username(specifier: 1...15),
  first_name: Faker::Name.unique.first_name,
  last_name: Faker::Name.unique.last_name,
  approved: [true, false].sample,
  money: Faker::Number.decimal(l_digits: 5, r_digits: 2)
)

trader4.skip_confirmation!
trader4.created_at = (rand*10).days.ago
trader4.save

trader5 = User.create(
  email: Faker::Internet.unique.email,
  password: "wedtrade",
  password_confirmation: 'wedtrade',
  username: Faker::Internet.unique.username(specifier: 1...15),
  first_name: Faker::Name.unique.first_name,
  last_name: Faker::Name.unique.last_name,
  approved: [true, false].sample,
  money: Faker::Number.decimal(l_digits: 5, r_digits: 2)
)

trader5.skip_confirmation!
trader5.created_at = (rand*10).days.ago
trader5.save

trader1asset1 = Asset.create(
  user_id: trader1.id,
  asset_name: 'JBFCF',
)

trader1asset1.created_at = trader1.created_at + 5.minutes
trader1asset1.save

trader1asset2 = Asset.create(
  user_id: trader1.id,
  asset_name: 'GOOG'
)

trader1asset2.created_at = trader1.created_at + 10.minutes
trader1asset2.save

trader2asset1 = Asset.create(
  user_id: trader2.id,
  asset_name: 'MSFT'
)

trader2asset1.created_at = trader2.created_at + 5.minutes
trader2asset1.save

trader3asset1 = Asset.create(
  user_id: trader3.id,
  asset_name: 'F',
)

trader3asset1.created_at = trader3.created_at + 5.minutes
trader3asset1.save

trader3asset2 = Asset.create(
  user_id: trader3.id,
  asset_name: 'META',
)

trader3asset2.created_at = trader3.created_at + 10.minutes
trader3asset2.save

trader4asset1 = Asset.create(
  user_id: trader4.id,
  asset_name: 'JBFCF'
)

trader4asset1.created_at = trader4.created_at + 5.minutes
trader4asset1.save

trader5asset1 = Asset.create(
  user_id: trader5.id,
  asset_name: 'MSFT'
)

trader5asset1.created_at = trader5.created_at + 5.minutes
trader5asset1.save

trader1trans1 = Transaction.create(
  user_id: trader1.id,
  user_email: trader1.email,
  asset_name: 'JBFCF',
  company_name: 'Jollibee Foods Corp.',
  asset_price: 201.0,
  shares: 5.0,
  transaction_total: 1005.0,
  transaction_type: 'buy'
)

trader1trans1.created_at = trader1asset1.created_at + 2.hours
trader1trans1.save

trader1trans2 = Transaction.create(
  user_id: trader1.id,
  user_email: trader1.email,
  asset_name: 'GOOG',
  company_name: 'Alphabet Inc',
  asset_price: 2410.0,
  shares: 3.5,
  transaction_total: 8435.0,
  transaction_type: 'buy'
)

trader1trans2.created_at = trader1asset2.created_at + 3.5.hours
trader1trans2.save

trader1trans3 = Transaction.create(
  user_id: trader1.id,
  user_email: trader1.email,
  asset_name: 'GOOG',
  company_name: 'Alphabet Inc',
  asset_price: 2410.0,
  shares: 1.2,
  transaction_total: 2892.0,
  transaction_type: 'sell'
)

trader1trans3.created_at = trader1asset2.created_at + 14.hours
trader1trans3.save

trader3trans1 = Transaction.create(
  user_id: trader3.id,
  user_email: trader3.email,
  asset_name: 'F',
  company_name: 'Ford Motor Co.',
  asset_price: 12.04,
  shares: 5.0,
  transaction_total: 60.2,
  transaction_type: 'buy'
)

trader3trans1.created_at = trader3asset1.created_at + 0.5.hours
trader3trans1.save

trader3trans2 = Transaction.create(
  user_id: trader3.id,
  user_email: trader3.email,
  asset_name: 'META',
  company_name: 'Meta Platforms Inc.',
  asset_price: 171.38,
  shares: 2.0,
  transaction_total: 342.76,
  transaction_type: 'buy'
)

trader3trans2.created_at = trader3asset2.created_at + 2.hours
trader3trans2.save

trader3trans3 = Transaction.create(
  user_id: trader3.id,
  user_email: trader3.email,
  asset_name: 'META',
  company_name: 'Meta Platforms Inc.',
  asset_price: 171.38,
  shares: 0.3,
  transaction_total: 51.414,
  transaction_type: 'sell'
)

trader3trans3.created_at = trader3asset2.created_at + 6.hours
trader3trans3.save

trader4trans1 = Transaction.create(
  user_id: trader4.id,
  user_email: trader4.email,
  asset_name: 'JBFCF',
  company_name: 'Jollibee Foods Corp.',
  asset_price: 201.0,
  shares: 5.0,
  transaction_total: 1005.0,
  transaction_type: 'buy'
)

trader4trans1.created_at = trader4asset1.created_at + 5.hours
trader4trans1.save

trader4trans2 = Transaction.create(
  user_id: trader4.id,
  user_email: trader4.email,
  asset_name: 'JBFCF',
  company_name: 'Jollibee Foods Corp.',
  asset_price: 201.0,
  shares: 5.0,
  transaction_total: 1005.0,
  transaction_type: 'sell'
)

trader4trans2.created_at = trader4asset1.created_at + 18.hours
trader4trans2.save

trader5trans1 = Transaction.create(
  user_id: trader5.id,
  user_email: trader5.email,
  asset_name: 'MSFT',
  company_name: 'Microsoft Corporation',
  asset_price: 276.58,
  shares: 5.0,
  transaction_total: 1382.9,
  transaction_type: 'buy'
)

trader5trans1.created_at = trader5asset1.created_at + 40.hours
trader5trans1.save