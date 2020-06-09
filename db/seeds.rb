# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: 'Dresses')
Category.create(name: 'Accessories')
Category.create(name: 'Shoes')

Product.create(name: 'Wedding dress' , description: 'Beautiful cream layered wedding dress' , price: '3000' , category_id: '1' , image_url: 'wedding_dress1')
Product.create(name: 'Wedding dress' , description: 'Beautiful cream flowing wedding dress' , price: '3500' , category_id: '1' , image_url: 'wedding_dress2')
Product.create(name: 'Wedding dress' , description: 'Beautiful multi colored wedding dress' , price: '2500' , category_id: '1' , image_url: 'wedding_dress3')
Product.create(name: 'Wedding dress' , description: 'Beautiful white ruffled wedding dress' , price: '4000' , category_id: '1' , image_url: 'wedding_dress4')
Product.create(name: 'Wedding dress' , description: 'Beautiful trail wedding dress' , price: '3750' , category_id: '1' , image_url: 'wedding_dress5')
Product.create(name: 'Tiara' , description: 'Royal Swarovski tiara ' , price: '1500' , category_id: '2' , image_url: 'tiara1')
Product.create(name: 'Tiara' , description: 'Princess Swarovski tiara ' , price: '2000' , category_id: '2' , image_url: 'tiara2')
Product.create(name: 'Tiara' , description: 'Princess Diana tiara ' , price: '3000' , category_id: '2' , image_url: 'tiara3')
Product.create(name: 'Veil' , description: 'Short beautiful veil' , price: '500' , category_id: '2' , image_url: 'veil1')
Product.create(name: 'Veil' , description: 'Long trailing veil' , price: '1500' , category_id: '2' , image_url: 'veil2')
Product.create(name: 'Shoes' , description: 'Silver glittering shoes' , price: '500' , category_id: '3' , image_url: 'shoes1')
Product.create(name: 'Shoes' , description: 'Simple white shoes with stones' , price: '300' , category_id: '3' , image_url: 'shoes2')
Product.create(name: 'Shoes' , description: 'Simple gold shoes with stones' , price: '750' , category_id: '3' , image_url: 'shoes3')
Product.create(name: 'Shoes' , description: 'Multi colored Jimmy Choo shoes' , price: '2500' , category_id: '3' , image_url: 'shoes4')