# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Category.destroy_all
Group.destroy_all
User.destroy_all
Theme.destroy_all
Post.destroy_all

puts "creating users"

louis = User.create!(
    email: 'louis@holdies.com',
    pseudo: 'louleman34',
    password: 'aaaaaa'
  )

puts "creating themes"

theme1 = Theme.create!(
    name: 'Qu\'est ce que le bonheur',
    user_id: louis.id
  )

puts "creating groups"

group1 = Group.create!(
    name: 'Famille Delon',
    private: false
  )

group2 = Group.create!(
    name: 'Les amoureux de Molière',
    private: true
  )

puts "creating categories"

category1 = Category.create!(
    name: 'Philosophy',
  )

puts "creating posts"

post1 = Post.create!(
    content: 'je pense que le bonheur est un choix et non un état',
    user_id: louis.id,
    theme_id: theme1.id,
    group_id: group1.id,
    category_id: category1.id
  )
