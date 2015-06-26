require_relative "./imdb.rb"

describe SeriesMastersOfTheUniverse do
	before do
		@search = SeriesMastersOfTheUniverse.new
end

describe "#compare_the_wire_and_friends"
	it "should compare the ratings of The wire and Friends" do
		result = @search.compare_the_wire_and_friends 
		expect(result).to eq("The Wire - Bajo escucha (2002) (TV Series)")
	end
end
