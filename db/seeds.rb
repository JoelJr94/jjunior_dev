Post.delete_all

user = User.first
text = "Lorem ipsum dolor sit amet. Ut eligendi nemo ut consequuntur eaque non debitis galisum vel deserunt perferendis. Et ullam tempore sed consectetur numquam ex numquam aperiam! Vel nihil quia eos delectus voluptas ea soluta unde qui quasi blanditiis quo reprehenderit nostrum non aperiam iste est possimus vero. Et reiciendis voluptatem qui dolorem accusantium ex distinctio nesciunt qui quisquam voluptatem. Ut iusto autem et repellat dignissimos ut officiis porro rem aliquid harum et facere deserunt ea internos consequatur sit recusandae autem. Eos nisi consequuntur aut iste delectus eos voluptates iste sed molestiae facilis. Ut nulla eligendi est nostrum autem ab fuga eius sit assumenda voluptatem in internos magnam. Ea debitis error qui quae quia qui laudantium facere eum iure quidem ut veritatis dignissimos. Ut earum praesentium et sint corrupti sit perspiciatis omnis."

p 'Iniciando ...'

Category.all.each do |category|
  30.times do
    Post.create!(
      title: "Article #{rand(10000)}",
      body: text,
      category_id: category.id,
      user_id: user.id,
      created_at: rand(365).days.ago
    )
  end
end

p 'Terminou!'