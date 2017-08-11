10.times do |n|
  name = Faker::Pokemon.name
  email = Faker::Internet.email
  password = Faker::Internet.password
  uid = SecureRandom.uuid
  User.create( name: name,
               email: email,
               password: password,
               uid: uid
               )
end

n = 1
while n <= 10
  topic = Topic.new(
    content: 'トピック',
  user_id: n + 1)

  i = 1
  while i <= 10
    topic.comments.build(
      content: 'コメント',
    user_id: i + 1)
  end

  topic.save
end
