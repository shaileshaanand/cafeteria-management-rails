# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

walk_in_customer = User.create!(
  first_name: "Walk In",
  last_name: "Customer",
  password: "1234",
  email: "walkin@example.com",
  role: "customer",
)

Config.set_walk_in_customer(walk_in_customer.id)

owner = User.create!(
  first_name: "Owner",
  password: "owner1234",
  email: "owner@pupilfirst.com",
  role: "admin",
)
