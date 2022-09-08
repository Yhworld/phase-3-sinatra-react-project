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
          image: "http://example.com/profile_image",
          caption: "this is a caption",
          likes: 20,
          comments: "soooo cool",
          user_id: user.id,
        )

puts "✅ Done seeding!"
