# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

cat1 = Cat.create({ birth_date: '15/7/2015', color: 'brown', name: 'Fluffy', sex: 'M', description: 'The fluffiest kitten.' })
cat2 = Cat.create({ birth_date: '31/10/1952', color: 'orange', name: 'Tiger', sex: 'M', description: 'You''d think we would''ve called him Tony, but here we are.' })
cat3 = Cat.create({ birth_date: '1/4/2019', color: 'grey', name: 'Paws', sex: 'F', description: 'All paws.' })
cat4 = Cat.create({ birth_date: '25/12/1964', color: 'black', name: 'Santa Claws', sex: 'M', description: 'More claws than Santa.' })
cat5 = Cat.create({ birth_date: '6/6/1973', color: 'white', name: 'Princess Carolyn', sex: 'F', description:  'A anthropomorphized, Pink Persian cat, but also your agent.' })