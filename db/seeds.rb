# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Crypto.create!(name: 'Bitcoin', symbol: 'BTC')
Crypto.create!(name: 'Ethereum', symbol: 'ETH')
Crypto.create!(name: 'Ripple', symbol: 'XRP')
Crypto.create!(name: 'Litecoin', symbol: 'LTC')


Tone.create!(tone_name: 'Analytical', url: 'https://i.imgur.com/cs60NGi.png')
Tone.create!(tone_name: 'Anger', url: 'https://i.imgur.com/gNJ1QZ6.png')
Tone.create!(tone_name: 'Confident', url: 'https://i.imgur.com/JtEbPHh.png')
Tone.create!(tone_name: 'Fear', url: 'https://i.imgur.com/PiE5a9Y.png')
Tone.create!(tone_name: 'Joy', url: 'https://i.imgur.com/s9HLKk5.png')
Tone.create!(tone_name: 'Sadness', url: 'https://i.imgur.com/C8UTNDy.png')
Tone.create!(tone_name: 'Tentative', url: 'https://i.imgur.com/VfWUeLz.png')
