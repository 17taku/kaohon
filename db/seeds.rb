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

10.times do |n|
  topic = Topic.new(
    title: 'タイトル'
    content: 'トピック',
  user_id: n + 1)

  10.times do
    topic.comments.build(
      content: 'コメント',
    user_id: n + 1)
  end

  topic.save
end
