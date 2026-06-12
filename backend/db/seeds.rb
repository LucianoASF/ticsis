users = 10.times.map do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
  )
end

20.times do
  Ticket.create!(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    status: %w[OPEN IN_PROGRESS RESOLVED CLOSED].sample,
    priority: %w[LOW MEDIUM HIGH CRITICAL].sample,
    user: users.sample
  )
end
