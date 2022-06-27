# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin = User.create(
  email: 'wednestrade-admin@wednestrade.com',
  password: 'W3dnesday@trade',
  password_confirmation: 'W3dnesday@trade',
  admin: true
)

admin.skip_confirmation!
admin.save

trader = User.create(
  email: 'wednestrade-trader@wednestrade.com',
  password: 'W3dnesday@trade',
  password_confirmation: 'W3dnesday@trade',
  admin: false
)

trader.skip_confirmation!
trader.save