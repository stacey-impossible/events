Organizer.create(title: Faker::Company.name)

5.times do
  Event.create(
    title: Faker::Superhero.name,
    city: Faker::Address.city,
    start_time: Faker::Date.between(2.days.ago, DateTime.tomorrow),
    address: Faker::Address.full_address,
    organizer: Organizer.last
  )
end
