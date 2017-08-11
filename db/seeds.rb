
10.times do |n|
  topic = Topic.new(
    content: 'トピック',
  user_id: n + 1)

  10.times do
    topic.comments.build(
      content: 'コメント',
    user_id: n + 1)
  end

  topic.save
end
