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