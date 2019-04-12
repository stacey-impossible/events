Admin.create(
  email: 'test@events.com',
  password: 'railstest'
)

Organizer.create(title: Faker::Company.name)

if Rails.env.development?
  5.times do
    Event.create(
      title: Faker::Superhero.name,
      city: 'Rostov-on-Don',
      start_time: Faker::Date.between(2.days.ago, DateTime.tomorrow),
      address: Faker::Address.full_address,
      organizer: Organizer.last
    )
  end
end
