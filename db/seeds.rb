# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Category.destroy_all
User.destroy_all
Theme.destroy_all
Inscription.destroy_all
Post.destroy_all
Group.destroy_all

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




puts "creating inscriptions"
inscription1 = Inscription.create!(
    comment: 'bonjour je suis tres inspiré',
    user_id: ,
    theme_id:

  )
inscription2 = Inscription.create!(
    comment: 'bonjour j\'aimerais participer',
    user_id: ,
    theme_id:
  )
5.times do
  Inscription.create!(
    comment: Faker::Dune.saying,
    user_id: ,
    theme_id:
  )
end
5.times do
  Inscription.create!(
    comment: Faker::Dune.saying,
    user_id: ,
    theme_id:
  )
end




puts "creating posts"
post1 = Post.create!(
    content: 'je pense que le bonheur est un choix et non un état',
    user_id: louis.id,
    theme_id: theme1.id,
    inscription_id: inscription1.id,
    category_id: category1.id
  )
80.times do
  Post.create!(
    content: Faker::Lovecraft.paragraphs,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    theme_id: ((Theme.first.id)..(Theme.last.id)).to_a.sample,
    inscription_id: ((Inscription.first.id)..(Inscription.last.id)).to_a.sample,
    category_id: ((Category.first.id)..(Category.last.id)).to_a.sample
  )
end
