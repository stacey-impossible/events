Organizer.create(
  title: Faker::Company.name,
  email: 'test@events.com',
  password: 'railstest'
)

if Rails.env.development?
  5.times do
    Event.create(
      title: Faker::Superhero.name,
      city: Faker::Address.city,
      start_time: Faker::Date.between(2.days.ago, DateTime.tomorrow),
      address: Faker::Address.full_address,
      organizer: Organizer.last
    )
  end
end
