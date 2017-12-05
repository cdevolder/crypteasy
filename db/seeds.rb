# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Platform.destroy_all
Crypto.destroy_all


platform = Platform.create!(
  name: 'Kraken',
  description: ''
  )

platform2 = Platform.create!(
  name: 'Gdax',
  description: ''
  )

platform3 = Platform.create!(
  name: 'Bitstamp',
  description: ''
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

exchangetimevalues = Exchangetimevalues.create!(
  euros: '1000' ,
  dollars:'1000' ,
  yuan: '1000',
  platform: 'platform',
  Crypto: 'crypto'
  )

exchangetimevalues2 = Exchangetimevalues.create!(
  euros: '1500' ,
  dollars:'1500' ,
  yuan: '1500',
  platform: 'platform',
  Crypto: 'crypto2'
  )

exchangetimevalues3 = Exchangetimevalues.create!(
  euros: '5000' ,
  dollars:'5000' ,
  yuan: '5000',
  platform: 'platform',
  Crypto: 'crypto3'
  )

exchangetimevalues4 = Exchangetimevalues.create!(
  euros: '2000' ,
  dollars:'2000' ,
  yuan: '2000',
  platform: 'platform2',
  Crypto: 'crypto'
  )

exchangetimevalues5 = Exchangetimevalues.create!(
  euros: '2500' ,
  dollars:'2500' ,
  yuan: '2500',
  platform: 'platform2',
  Crypto: 'crypto2'
  )

exchangetimevalues6 = Exchangetimevalues.create!(
  euros: '10000' ,
  dollars:'10000' ,
  yuan: '10000',
  platform: 'platform2',
  Crypto: 'crypto3'
  )

exchangetimevalues7 = Exchangetimevalues.create!(
  euros: '3000' ,
  dollars:'3000' ,
  yuan: '3000',
  platform: 'platform3',
  Crypto: 'crypto'
  )

exchangetimevalues8 = Exchangetimevalues.create!(
  euros: '2500' ,
  dollars:'2500' ,
  yuan: '2500',
  platform: 'platform3',
  Crypto: 'crypto2'
  )

exchangetimevalues9 = Exchangetimevalues.create!(
  euros: '15000' ,
  dollars:'15000' ,
  yuan: '15000',
  platform: 'platform3',
  Crypto: 'crypto3'
  )

