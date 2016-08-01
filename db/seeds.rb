User.destroy_all
Pokemon.destroy_all
Rating.destroy_all

10.times do
  User.create!({
    email: Faker::Internet.email,
    password: "passpass",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    birth_date: Faker::Date.between(15000.days.ago, 7500.days.ago),
    occupation: "Pokémon trainer"
  })
end

Pokemon.create!({
  name: "Bulbasaur",
  number: 1,
  category: "Seed",
  height: 0.7,
  weight: 6.9
})

Pokemon.create!({
  name: "Charmander",
  number: 4,
  category: "Lizzard",
  height: 0.6,
  weight: 8.5
})

Pokemon.create!({
  name: "Squirtle",
  number: 7,
  category: "Turtle",
  height: 0.5,
  weight: 9.0
})

Pokemon.create!({
  name: "Pikachu",
  number: 25,
  category: "Mouse",
  height: 0.4,
  weight: 6.0
})

User.all.each do |user|
  Pokemon.all.each do |pokemon|
      Rating.create!({
      stars: (1..5).to_a.sample,
      pokemon_id: pokemon.id,
      user_id: user.id
    })
  end
end
