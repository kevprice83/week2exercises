# SL10. More TDD (I mean, TV) series!

# Tired of the discussion between Sopranos vs The Wire? Hint: watch True Detective, House of Cards or Breaking Bad, and we’ll talk later.
# Are you tired of watching Friends for the 254th time? Well, I wouldn’t recommend How I Met Your Mother too much but… how about tech? Check
# out Halt & Catch Fire (AMC) or Silicon Valley (HBO)! Anyway, wake up, we are tired and it’s Monday, but you don’t want to look like
# someone from The Walking Dead, right?

# Let’s enlarge SL9 but with a change. Until now, we used our beliefs for the returning values of the methods. This time, though, we will
# use real information from one site called IMDB, which turns out to have a nice and fun API. And this time, instead of writing the
# tests afterwards, we will write them first hand. Let’s go do some nice TDD!

# The first method will take a string as a parameter (for example, ‘Cat’) and return the number of results for that search in IMDB. For
# ‘Cat’, it’s more than 200 examples! That’s a lot of cats indeed!

# The second method will be similar to “best_within”… but instead of returning the best one based on the rating, it will return the one
# with most seasons! We will call this method “most_seasons_from”. Example: we call the method with the following TV series: Breaking Bad
# (5 seasons), Friends (10 seasons), Game of Thrones (6 seasons: they renewed for two more!) and The Office (9 seasons). It should return Friends!
# And this way we'll be able to know which show will make us more socially missing, too.

# The third method will be similar to "most_seasons_from", but instead of having the season into account, it will have the number of episodes
# into account.

# The four method will be a comparator (it might turn into our best friend!). It will take an array of strings, each one being
# the name of a TV show, and it will return the best one using IMDB ratings. For example, if we pass Breaking Bad, Pacific Blue (oh, those
# times!) and The Affair, it will return Breaking Bad (although The Affair is really good, and just won a Golden Globe, even when Golden Globes
# are worthless).

# The fifth and final method will get an integer argument, let's call it X, and will return a hash with the top X movies following IMDB
# rating, including it too. The integer argument should be between 1 and 250, and the returned hash should look like:
# {
#   'Shawsank Redemption' => 9.2,
#   'The Godfather' => 9.2,
#   'The Godfather II' => 9.0,
#   'The Dark Knight' => 8.9,
#   ...and so on until having X movies
# }

# ============================================================
# AND REMEMBER, WE WANT TDD. TESTS FIRST, THEN IMPLEMENTATION.
# ============================================================

# Note: if you grab results from Imdb::Search, it will always return a Imdb::Movie object, not Imdb::Serie. In order to get info an Imdb::Serie,
# which has information like the number of episodes, just use the id to fetch the serie directly:
#   dexter_movie = Imdb::Search.new(‘Dexter’).movies.first
#   dexter_serie = Imdb::Serie.new(dexter_movie.id)
require 'pry'
require 'imdb'
require 'rspec'

class SeriesMastersOfTheUniverse

	def initialize
		@library = []
	end
	#def compare_the_wire_and_friends
	#	the_wire = Imdb::Search.new("The Wire").movies[0]
	#	friends = Imdb::Search.new("Friends").movies[0]

	#	if the_wire.rating > friends.rating
	#		the_wire.title
	#	else
	#		friends.title
	#	end
	#end

	def create_library
		breaking_bad = Imdb::Search.new("Breaking Bad").movies[0]
		breaking_bad_series = Imdb::Serie.new(breaking_bad.id)
		game_of_thrones = Imdb::Search.new("Game of Thrones").movies[0]
		game_of_thrones_series = Imdb::Serie.new(game_of_thrones.id)
		the_wire = Imdb::Search.new("The Wire").movies[0]
		the_wire_series = Imdb::Serie.new(the_wire.id)
		band_of_brothers = Imdb::Search.new("Band of Brothers").movies[0]
		band_of_brothers_series = Imdb::Serie.new(band_of_brothers.id)
		the_pacific = Imdb::Search.new("The Pacific").movies[0]
		the_pacific_series = Imdb::Serie.new(the_pacific.id)
		boardwalk_empire = Imdb::Search.new("Boardwalk Empire").movies[0]
		boardwalk_empire_series = Imdb::Serie.new(boardwalk_empire.id)
		twin_peaks = Imdb::Search.new("Twin Peaks").movies[0]
		twin_peaks_series = Imdb::Serie.new(twin_peaks.id)
		black_adder_goes_forth = Imdb::Search.new("Black Adder Goes Forth").movies[0]
		black_adder_goes_forth_series = Imdb::Serie.new(black_adder_goes_forth.id)
		fawlty_towers = Imdb::Search.new("Fawlty Towers").movies[0]
		fawlty_towers_series = Imdb::Serie.new(fawlty_towers.id)
		michael_palin = Imdb::Search.new("Michael Palin: Around the World in 80 Days").movies[0]
		michael_palin_series = Imdb::Serie.new(michael_palin.id)
		@library.push(breaking_bad_series, game_of_thrones_series, the_wire_series, band_of_brothers_series, the_pacific_series, boardwalk_empire_series, twin_peaks_series, black_adder_goes_forth_series, fawlty_towers_series, michael_palin_series)
	end

	def most_seasons_from
		@library.sort! do |series, series2|
			series.seasons.size <=> series2.seasons.size
		end
		@library.each do |serie|
			puts serie.seasons.size
		end
	end
		#binding.pry
		#movies.sort! do |film, film2|
		#	film.cast_members.size <=> film2.cast_members.size
		#end
		#movies.each do |film|
	#		puts film.title
	#	end


end


search = SeriesMastersOfTheUniverse.new
search.create_library
search.most_seasons_from
