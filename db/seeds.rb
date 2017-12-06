# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Exchangetimevalue.destroy_all
Crypto.destroy_all
Platform.destroy_all




platform = Platform.create!(
  name: 'Kraken',
  description: 'ok'
  )

platform2 = Platform.create!(
  name: 'Gdax',
  description: 'ok'
  )

platform3 = Platform.create!(
  name: 'Bitstamp',
  description: 'ok'
  )

crypto = Crypto.create!(
  name: 'Bitcoin',
  accronym: 'BTC'
  )

crypto2 = Crypto.create!(
  name: 'Ethereum',
  accronym: 'ETH'
  )
crypto3 = Crypto.create!(
  name: 'Litcoin',
  accronym: 'LTC'
  )
