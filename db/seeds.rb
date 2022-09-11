puts "🌱 Seeding spices..."

# Seed your database here

user = User.create(
      username: "Liza",
      email: "liza@example.com",
      password: "1234567890",
      profile_image: "http://example.com/profile_image",
    )

  post = Post.create(
          location: "http://example.com/profile_image",
          image: "https://images.unsplash.com/photo-1523510468197-455cc987be86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
          caption: "this is a caption",
          likes: 20,
          comments: "soooo cool",
          user_id: user.id,
        )

puts "✅ Done seeding!"
