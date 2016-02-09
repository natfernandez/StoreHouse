# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
colours = [ { description: 'blanco' }, { description: 'beige' },
{ description: 'crudo' }, { description: 'amarillo' },
{ description: 'azul cielo' }, { description: 'azul marino' },
{ description: 'naranja' }, { description: 'rosa' },
{ description: 'tierra' }, { description: 'rojo' },
{ description: 'verde pistacho' }, { description: 'verde oscuro' },
{ description: 'negro' }, { description: 'berenjena' }]

colours.each do |item|
  colour = Colour.find_or_create_by_description item[:description]
end

sizes = [{ description: '36', type: 'NUMERIC' },
         { description: '38', type: 'NUMERIC' },
         { description: '40', type: 'NUMERIC' },
         { description: '42', type: 'NUMERIC' },
         { description: '44', type: 'NUMERIC' },
         { description: '46', type: 'NUMERIC' },
         { description: 'XS', type: 'LETTER' },
         { description: 'S', type: 'LETTER' },
         { description: 'M', type: 'LETTER' },
         { description: 'L', type: 'LETTER' },
         { description: 'XL', type: 'LETTER' },
         { description: 'XXL', type: 'LETTER' }
]


sizes.each do |item|
  size = Size.find_or_create_by_description_and_type item[:description], item[:type]
end

