@bilbo = User.create(username: "Bilbo", email: "Bilbo@test.com", password: "password")
@george = User.create(username: "George", email: "George@test.com", password: "password")
@fred = User.create(username: "Fred", email: "Fred@test.com", password: "password")
@sara = User.create(username: "Sara", email: "Sara@test.com", password: "password")
@benjamin = User.create(username: "Benjamin", email: "Benjamin@test.com", password: "password")
@silverpyro = User.create(username: "Silverpyro", email: "Silverpyro@test.com", password: "password")


@bilbo.movies.create(title: "Inception", release_year: 2010, director: "Christopher Nolan")
@sara.movies.create(title: "Toy Story 3", release_year: 2010, director: "Lee Unkrich")
@george.movies.create(title: "The Social Network", release_year: 2010, director: "David Fincher")
@george.movies.create(title: "Skyfall", release_year: 2012, director: "Sam Mendes")
@fred.movies.create(title: "Gravity", release_year: 2013, director: "Alfonso Cuaron")
@george.movies.create(title: "Her", release_year: 2013, director: "Spike Jonze")
@george.movies.create(title: "Inside Llewyn Davis", release_year: 2013, director: "Ethan Coen")
@george.movies.create(title: "Selma", release_year: 2014, director: "Ava DuVernay")
@george.movies.create(title: "The Grand Budapest Hotel", release_year: 2014, director: "Wes Anderson")
@sara.movies.create(title: "Boyhood", release_year: 2014, director: "Richard Linklater")
@sara.movies.create(title: "Inside Out", release_year: 2015, director: "Pete Docter")
@silverpyro.movies.create(title: "Mad Max: Fury Road", release_year: 2015, director: "George Miller")
@fred.movies.create(title: "Midnight Special", release_year: 2016, director: "Jeff Nichols")
@sara.movies.create(title: "Moonlight", release_year: 2016, director: "Barry Jenkins")
@sara.movies.create(title: "Lady Bird", release_year: 2017, director: "Greta Gerwig")
@fred.movies.create(title: "Get Out", release_year: 2017, director: "Jordan Peele")
@fred.movies.create(title: "The Shape of Water", release_year: 2017, director: "Guillermo del Toro")
@silverpyro.movies.create(title: "Black Panther", release_year: 2018, director: "Ryan Coogler")
@silverpyro.movies.create(title: "A Quiet Place", release_year: 2018, director: "John Krasinski")
@silverpyro.movies.create(title: "Spider-Man: Into the Spider-Verse", release_year: 2018, director: "Bob Persichetti")

@benjamin.games.create(title: "Fire Emblem: Three Houses", release_year: 2019, company: "Nintendo", console: "Switch", genre: "Tactical RPG")
@benjamin.games.create(title: "Kingdom Hearts 3", release_year: 2019, company: "Square Enix", console: "All", genre: "Action RPG")
