# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

cat1 = Cat.create({birth_date: '1/4/1990', color: 'brown', name: 'A', sex: 'M', description: 'wwww'  })
cat2 = Cat.create({birth_date: '1/4/1995', color: 'orange', name: 'B', sex: 'F', description: 'ffff' })
cat3 = Cat.create({birth_date: '1/4/2005', color: 'grey', name: 'C', sex: 'F', description: 'ffff' })
cat4 = Cat.create({birth_date: '1/4/2010', color: 'black', name: 'D', sex: 'M', description: 'gggg' })
cat5 = Cat.create({birth_date: '1/4/2015', color: 'white', name: 'E', sex: 'F', description:  'hhhhh'})