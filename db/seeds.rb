# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Seeding...'

AdminUser.create(email: 'admin@example.com', password: 'password')

supplier1 = Supplier.create(name: 'Alibaba Component Supplier')
supplier2 = Supplier.create(name: 'American Dream Supplier')

comp_item1 = ItemComponent.create(
  name: 'Jet Engine', 
  description: 'This would go great in a plane',
  supplier_id: supplier2.id,
  price: 20.99
  )
  
comp_item2 = ItemComponent.create(
  name: 'Jet Wings', 
  description: 'This would go great in making sure your plane doesnt come crashing down',
  supplier_id: supplier2.id,
  price: 10.99
  )

comp_item3 = ItemComponent.create(
  name: 'Aloe Vera Gel', 
  description: 'This would go great in a hair gel, body wash, or moisturizer',
  supplier_id: supplier1.id,
  price: 0.99
  )

comp_item4 = ItemComponent.create(
  name: 'Fragrance', 
  description: 'This would go great in making a product smell good',
  supplier_id: supplier1.id,
  price: 1.99
  )

item1 = Item.create(
  name: 'Hair Gel',
  description: 'An Aloe Vera based hair gel that smells great',
  price: 5.99
)

item2 = Item.create(
  name: 'A complete Jet!',
  description: 'A jet to go from A to B',
  price: 105.99
)

item_joins1 = ItemComponentItem.create(item_component_id: comp_item4.id, item_id: item1.id)
item_joins2 = ItemComponentItem.create(item_component_id: comp_item3.id, item_id: item1.id)
item_joins2 = ItemComponentItem.create(item_component_id: comp_item2.id, item_id: item2.id)
item_joins2 = ItemComponentItem.create(item_component_id: comp_item1.id, item_id: item2.id)

puts 'Finished Seeding!'