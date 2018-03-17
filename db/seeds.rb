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


puts "creating users"
louis = User.create!(
    email: 'louis@holdies.com',
    pseudo: 'loulou34',
    password: 'aaaaaa'
  )

olivier = User.create!(
    email: 'louleman34@gmail.com',
    pseudo: 'oliv34',
    password: 'aaaaaa'
  )

sophie = User.create!(
    email: 'sophie@gmail.com',
    pseudo: 'Sophie34',
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
    name: 'Philosophy'
  )
category2 = Category.create!(
    name: 'Litterature'
  )
category3 = Category.create!(
    name: 'Mathematics'
  )
category4 = Category.create!(
    name: 'Religion'
  )



puts "creating themes"
theme1 = Theme.create!(
    name: 'Qu\'est ce que le bonheur?',
    user_id: louis.id,
    category_id: category1.id,
    deadline: "30/03/2018"
  )
theme2 = Theme.create!(
    name: 'l\'amour est il prévisible?',
    user_id: olivier.id,
    category_id: category1.id,
    deadline: "10/03/2018"
  )

theme3 = Theme.create!(
    name: 'l\'histoire est elle condamnée à se répéter?',
    user_id: sophie.id,
    category_id: category2.id,
    deadline: "10/03/2018"
  )

# 20.times do
#   Theme.create!(
#     name: Faker::Dune.quote,
#     user_id: ((User.first.id)..(User.last.id)).to_a.sample,
#     category_id: ((Category.first.id)..(Category.last.id)).to_a.sample,
#     deadline: Faker::Date.forward(30)
#   )
# end

puts "creating inscriptions"
inscription1 = Inscription.create!(
    comment: 'bonjour je suis tres inspiré',
    user_id: louis.id,
    theme_id: theme2.id,
    accepted: false
  )
inscription2 = Inscription.create!(
    comment: 'bonjour j\'aimerais participer',
    user_id: olivier.id,
    theme_id: theme1.id,
    accepted: true
  )
# 50.times do
#   Inscription.create!(
#     comment: Faker::Dune.saying,
#     user_id: ((User.first.id)..(User.last.id)).to_a.sample,
#     theme_id:((Theme.first.id)..(Theme.last.id)).to_a.sample,
#     accepted: nil
#   )
# end



puts "creating posts"
post1 = Post.create!(
    content: 'je pense que le bonheur est un choix et non un état',
    private: false,
    online: false,
    user_id: olivier.id,
    theme_id: theme1.id,
    category_id: category1.id
  )
post2 = Post.create!(
    content: 'l\'amour est un incroyable sentiment que je ne saurais décrire en quelques mots, il me faudrait des nuites entieres pour ecpliquer ce que je ressens lorsque je suis amoureux',
    private: false,
    online: true,
    user_id: louis.id,
    theme_id: theme2.id,
    category_id: category1.id
  )


# 60.times do
#   Post.create!(
#     content: Faker::Lovecraft.paragraphs,
#     private: false,
#     online: false,
#     user_id: ((User.first.id)..(User.last.id)).to_a.sample,
#     theme_id: ((Theme.first.id)..(Theme.last.id)).to_a.sample,
#     category_id: ((Category.first.id)..(Category.last.id)).to_a.sample
#   )
# end

puts "successful CONGRATULATIONS !!!!"
