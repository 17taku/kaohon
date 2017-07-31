100.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::StarWars.character
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               name: name
               )
end
n = 1
while n <= 100
  title = Faker::Pokemon.name
  content = Faker::Lorem.paragraph
  Topic.create(
    title: title,
    content: content,
    user_id: n
  )
  n = n + 1
end
