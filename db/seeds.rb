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

mountain_photo_urls = %w[
  https://images.unsplash.com/photo-1537281921002-30e96f9cddf0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1353&q=80
  https://images.unsplash.com/photo-1493246507139-91e8fad9978e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80
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

mountains_address = [
  "Pedra da Gávea - Barra da Tijuca, Rio de Janeiro - RJ",
  "Avenida Niemeyer - Vidigal, RJ - Rio de Janeiro",
  "Avenida Pasteur - Urca, Rio de Janeiro - RJ",
  "Barra de Guaratiba, Rio de Janeiro - RJ",
  "Cristo Redentor - Alto da Boa Vista, Rio de Janeiro - RJ"
]

users_photos = %w[
  https://images.unsplash.com/photo-1495374519711-e22c8b4596a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80
  https://images.unsplash.com/photo-1465391422195-6be887eb93a9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80
  https://images.unsplash.com/photo-1472066719480-ecc7314ed065?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80
  https://images.unsplash.com/photo-1483323323858-4916bde7bd5d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80
  https://images.unsplash.com/photo-1465405319612-e87fd78c23f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80
  https://images.unsplash.com/photo-1470259078422-826894b933aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80
  https://images.unsplash.com/photo-1544435253-f0ead49638fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80
]

mountains_address.each do |address|
  Mountain.create!(
    name: Faker::Movies::LordOfTheRings.location,
    city: "Rio de Janeiro",
    address: address,
    remote_photo_url: mountain_photo_urls.sample
    )
  sleep 2
end

users_photos.each do |photo|
  User.create!(
    first_name: Faker::Movies::LordOfTheRings.character,
    last_name: Faker::Movies::VForVendetta.character,
    bio: Faker::Lorem.paragraph_by_chars,
    remote_photo_url: photo,
    password: "123456",
    email: Faker::Internet.email
  )
  sleep 2
end

mountain_photo_urls.each do |photo_url|
  Experience.create!(
    user_id: User.pluck(:id).sample,
    name: Faker::Book.title,
    description: Faker::Lorem.paragraph_by_chars,
    capacity: rand(1..2),
    duration: rand(2..7),
    mountain_id: Mountain.pluck(:id).sample,
    price: rand(150..300),
    remote_photo_url: photo_url
  )
  sleep 2
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

