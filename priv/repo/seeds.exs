alias Concertrip.Repo
alias Concertrip.Room
alias Concertrip.Whiteboard

Repo.insert!(%Room{name: "room1", plan: 1})
Repo.insert!(%Room{name: "room2", plan: 1})

for i <- 1..2 do
  Room
  |> Repo.get(i)
  |> Ecto.build_assoc(:whiteboard)
  |> Repo.insert!
end

for _ <- 1..5 do
  Whiteboard
  |> Repo.get(1)
  |> Ecto.build_assoc(:stickers,
       url: Faker.Internet.url,
       title: Faker.Name.title)
  |> Repo.insert!

  Whiteboard
  |> Repo.get(2)
  |> Ecto.build_assoc(:stickers,
       url: Faker.Internet.url,
       title: Faker.Name.title)
  |> Repo.insert!
end
