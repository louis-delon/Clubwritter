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

5.times do
  User.create!(
    email: Faker::Internet.email,
    pseudo: Faker::Simpsons.character,
    password: 'aaaaaa'
  )
end

puts "creating themes"

theme1 = Theme.create!(
    name: 'Qu\'est ce que le bonheur',
    user_id: louis.id
  )

20.times do
  Theme.create!(
    name: Faker::Dune.quote,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample
  )
end

puts "creating groups"

group1 = Group.create!(
    name: 'Famille Delon',
    private: false
  )

group2 = Group.create!(
    name: 'Les amoureux de Molière',
    private: true
  )

5.times do
  Group.create!(
    name: Faker::Dune.saying,
    private: true
  )
end

5.times do
  Group.create!(
    name: Faker::Dune.saying,
    private: false
  )
end

puts "creating categories"

category1 = Category.create!(
    name: 'Philosophy',
  )

category2 = Category.create!(
    name: 'Litterature',
  )

category3 = Category.create!(
    name: 'Mathematics',
  )

puts "creating posts"

post1 = Post.create!(
    content: 'je pense que le bonheur est un choix et non un état',
    user_id: louis.id,
    theme_id: theme1.id,
    group_id: group1.id,
    category_id: category1.id
  )

80.times do
  Post.create!(
    content: Faker::Lovecraft.paragraphs,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    theme_id: ((Theme.first.id)..(Theme.last.id)).to_a.sample,
    group_id: ((Group.first.id)..(Group.last.id)).to_a.sample,
    category_id: ((Category.first.id)..(Category.last.id)).to_a.sample
  )
end
