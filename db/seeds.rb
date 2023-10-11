# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Seeding...'

FactoryBot.create_list(:user, 10)
FactoryBot.create_list(:user, 30, existing_org: true)
FactoryBot.create_list(:item, 15)
FactoryBot.create_list(:item, 45, existing_supplier: true)
FactoryBot.create_list(:item_component, 10, :with_existing_item, :with_existing_supplier)
FactoryBot.create_list(:item_component, 10, :with_existing_item, :with_supplier)
FactoryBot.create_list(:item_component, 10, :with_existing_item)
FactoryBot.create_list(:item_component, 10, :with_item, :with_existing_supplier)
FactoryBot.create_list(:item_component, 10, :with_item, :with_supplier)
FactoryBot.create_list(:item_component, 10, :with_item)
FactoryBot.create(:admin_user)

puts 'Finished Seeding!'
