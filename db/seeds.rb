# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Order.create(is_paid: false, is_completed: false, created_at: 'Sun, 01 Jan 2012 00:00:00 +0300', payee_id: 1, payer_id: 2  )
