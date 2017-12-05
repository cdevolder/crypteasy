# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Platform.destroy_all
Crypto.destroy_all
Exchangetimevalue.destroy_all


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

exchangetimevalue = Exchangetimevalue.create!(
  euro: '1000' ,
  dollar:'1000' ,
  platform: platform,
  crypto: crypto
  )

exchangetimevalue2 = Exchangetimevalue.create!(
  euro: '1500' ,
  dollar:'1500' ,
  platform: platform,
  crypto: crypto2
  )

exchangetimevalue3 = Exchangetimevalue.create!(
  euro: '5000' ,
  dollar:'5000' ,
  platform: platform,
  crypto: crypto3
  )

exchangetimevalue4 = Exchangetimevalue.create!(
  euro: '2000' ,
  dollar:'2000' ,
  platform: platform2,
  crypto: crypto
  )

exchangetimevalue5 = Exchangetimevalue.create!(
  euro: '2500' ,
  dollar:'2500' ,
  platform: platform2,
  crypto: crypto2
  )

exchangetimevalue6 = Exchangetimevalue.create!(
  euro: '10000' ,
  dollar:'10000' ,
  platform: platform2,
  crypto: crypto3
  )

exchangetimevalue7 = Exchangetimevalue.create!(
  euro: '3000' ,
  dollar:'3000' ,
  platform: platform3,
  crypto: crypto
  )

exchangetimevalue8 = Exchangetimevalue.create!(
  euro: '2500' ,
  dollar:'2500' ,
  platform: platform3,
  crypto: crypto2
  )

exchangetimevalue9 = Exchangetimevalue.create!(
  euro: '15000' ,
  dollar:'15000' ,
  platform: platform3,
  crypto: crypto3
  )

