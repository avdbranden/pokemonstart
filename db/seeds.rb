# Clean DB by destroying every DB instances

User.destroy_all
Pokemon.destroy_all
Move.destroy_all
Rating.destroy_all

# Create 10 random users

counter = 0
10.times do
  user = User.create!({
    email: "test#{counter += 1}@test.com",
    password: "passpass",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    birth_date: Faker::Date.between(15000.days.ago, 7500.days.ago),
    occupation: "Pokémon trainer"
  })
  puts "Created #{user.email}"
end

## Create Pokémon
# Create Bulbasaur with associated moves

bulbasaur = Pokemon.create!({
  name: "Bulbasaur",
  number: 1,
  category: "Seed",
  height: 0.7,
  weight: 6.9
})
puts "Created #{bulbasaur.name}"

Move.create!({
  name: "Tackle",
  move_cat: "Normal",
  label: "label-info",
  pokemon_id: bulbasaur.id
})

Move.create!({
  name: "Poison powder",
  move_cat: "Grass",
  label: "label-success",
  pokemon_id: bulbasaur.id
})

Move.create!({
  name: "Vine whip",
  move_cat: "Grass",
  label: "label-success",
  pokemon_id: bulbasaur.id
})

Move.create!({
  name: "Razor leaf",
  move_cat: "Grass",
  label: "label-success",
  pokemon_id: bulbasaur.id
})
bulbasaur.moves.each do |move|
  puts "Created #{move.name} for #{bulbasaur.name}"
end

# Create Charmander with associated moves

charmander = Pokemon.create!({
  name: "Charmander",
  number: 4,
  category: "Lizzard",
  height: 0.6,
  weight: 8.5
})
puts "Created #{charmander.name}"

Move.create!({
  name: "Scratch",
  move_cat: "Normal",
  label: "label-info",
  pokemon_id: charmander.id
})

Move.create!({
  name: "Ember",
  move_cat: "Fire",
  label: "label-danger",
  pokemon_id: charmander.id
})

Move.create!({
  name: "Flamethrower",
  move_cat: "Fire",
  label: "label-danger",
  pokemon_id: charmander.id
})

Move.create!({
  name: "Dragon rage",
  move_cat: "Dragon",
  label: "label-default",
  pokemon_id: charmander.id
})
charmander.moves.each do |move|
  puts "Created #{move.name} for #{charmander.name}"
end

# Create Squirtle with associated moves

squirtle = Pokemon.create!({
  name: "Squirtle",
  number: 7,
  category: "Turtle",
  height: 0.5,
  weight: 9.0
})
puts "Created #{squirtle.name}"

Move.create!({
  name: "Tail whip",
  move_cat: "Normal",
  label: "label-info",
  pokemon_id: squirtle.id
})

Move.create!({
  name: "Bubble",
  move_cat: "Water",
  label: "label-primary",
  pokemon_id: squirtle.id
})

Move.create!({
  name: "Bite",
  move_cat: "Dark",
  label: "label-default",
  pokemon_id: squirtle.id
})

Move.create!({
  name: "Hydro pump",
  move_cat: "Water",
  label: "label-primary",
  pokemon_id: squirtle.id
})
squirtle.moves.each do |move|
  puts "Created #{move.name} for #{squirtle.name}"
end

# Create Pikachu with associated moves

pikachu = Pokemon.create!({
  name: "Pikachu",
  number: 25,
  category: "Mouse",
  height: 0.4,
  weight: 6.0
})
puts "Created #{pikachu.name}"

Move.create!({
  name: "Quick attack",
  move_cat: "Normal",
  label: "label-info",
  pokemon_id: pikachu.id
})

Move.create!({
  name: "Thunder schock",
  move_cat: "Electric",
  label: "label-warning",
  pokemon_id: pikachu.id
})

Move.create!({
  name: "Thunder bolt",
  move_cat: "Electric",
  label: "label-warning",
  pokemon_id: pikachu.id
})
pikachu.moves.each do |move|
  puts "Created #{move.name} for #{pikachu.name}"
end

## Create ratings
# Each user assigns one rating to each Pokémon

User.all.each do |user|
  Pokemon.all.each do |pokemon|
      Rating.create!({
      stars: (1..5).to_a.sample,
      pokemon_id: pokemon.id,
      user_id: user.id
    })
    puts "Created rating for #{pokemon.name} by #{user.email}"
  end
end
