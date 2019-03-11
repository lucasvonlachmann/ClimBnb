#
if Rails.env.development?
  puts 'Destroying bookings...'
  Booking.destroy_all

  puts 'Destroying experiences...'
  Experience.destroy_all

  puts 'Destroying mountains...'
  Mountain.destroy_all

  puts 'Destroying users...'
  User.destroy_all
end

require 'faker'

5.times do
  Mountain.create!(
    name: Faker::Movies::LordOfTheRings.location,
    city: "Rio de Janeiro"
    )
end

10.times do
  User.create!(
    first_name: Faker::Movies::LordOfTheRings.character,
    last_name: Faker::Movies::VForVendetta.character,
    password: "123456",
    email: Faker::Internet.email
  )
end

mountain_photo_urls = %w[
  https://images.unsplash.com/photo-1537281921002-30e96f9cddf0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1353&q=80
  https://images.unsplash.com/photo-1523188890643-9460d9e59cee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=333&q=80
  https://images.unsplash.com/photo-1508287459906-37445322fdf6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80
  https://images.unsplash.com/photo-1476297820623-03984cf5cdbb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80
  https://images.unsplash.com/photo-1534328536581-ae285ee49c67?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80
  https://images.unsplash.com/photo-1520720810040-f85066da6d93?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80
  https://images.unsplash.com/photo-1533841061331-725aaf116901?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80
  https://images.unsplash.com/photo-1463693396721-8ca0cfa2b3b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80
  https://images.unsplash.com/photo-1525719504653-bae5211079c9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80
  https://images.unsplash.com/photo-1521115715763-2fcaa0608e9b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=749&q=80
  https://images.unsplash.com/photo-1547212543-d8d490fecd7c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80
  https://images.unsplash.com/photo-1544989163-df6cdad98651?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80
]

mountain_photo_urls.each do |photo_url|
  Experience.create!(
    user_id: User.pluck(:id).sample,
    name: Faker::Book.title,
    description: Faker::BossaNova.song,
    capacity: rand(1..2),
    duration: rand(2..7),
    mountain_id: Mountain.pluck(:id).sample,
    price: rand(150..300),
    remote_photo_url: photo_url
  )
end

10.times do
  experience_id = Experience.pluck(:id).sample
  experience = Experience.find(experience_id)
  Booking.create!(
    user_id: User.pluck(:id).sample,
    experience: experience,
    date: Faker::Date.forward(23),
    number_of_people: rand(1..2),
    price: experience.price
  )
end

