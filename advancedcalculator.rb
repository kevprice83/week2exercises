# SL12. Crazy numbers

# We will rest from TV shows for a while. I mean, I love them, but even sometimes it's nice to just stop and do something else.

# And what else is fun? Numbers! We are going to write a nice Numermaster class that treats with, well... yeah, numbers.

# Its first method will take an array of numbers. If most of them are positive, it should return only the positive ones. If most of them are
# negative, it should return the negative ones. Otherwise (if the amount of positives and negatives is the same) return nil.

# The second method takes a set of numbers. Then, it should return an array with four values:
# 1. The mode
# 2. The median
# 3. The mean
# 4. The size of the array
# In the event that the array we pass is empty, it should just return nil.

# The third and final method will take a positive integer (let's call it "n") as a parameter, and return the n-th Fibonacci number. If the
# parameter is zero or less, it should just return nil. More info: http://en.wikipedia.org/wiki/Fibonacci_number

# Your goal is to follow these three steps:
# 1. Quickly write a first implementation of the three methods.
# 2. Write a nice set of tests for each method.
# 3. Once the test pass, refactor your methods so they are perfect (so perfect that even Ruby creator would see them with joy and pride!)


require 'pry'

class Numermaster
	#attr_accessor :numbers
	
	def watershed(array)
		return [] if array.empty?
		pos_num = array.select {|a| a > 0}
		neg_num = array.select {|a| a < 0}
		if pos_num.size > neg_num.size
			return pos_num
		elsif neg_num.size > pos_num.size
			return neg_num
		else
			return nil
		end
	end

	#alternative method to calculate median
	#sorted_numbers = array.sort
	#median = if sorted_numbers.size.even?
	#pos1 = size / 2
	#pos2 = size / 2 - 1
	#(sorted_numbers[pos1] + sorted_numbers[pos2]) / 2.0

	def averages(array)
		averages = []
		averages << mean(array)
		averages << median(array)
		averages << mode(array)
		averages << length(array)
	end

	def median(array)
		sorted_numbers = array.sort
		length = sorted_numbers.length
		(sorted_numbers[(length-1)/2] + sorted_numbers[length/2])/2.0
	end
	def mean(array)
		(array.reduce(:+))/array.length
	end
	def mode(array)
		hash_count = Hash.new(0)
		array.each do |i|
			hash_count[i] += 1
		end
		max_freq = hash_count.values.max
		mode = hash_count.select {|k, v| v == max_freq}
		result =[]
		mode.each do
			|k,v| result << k
		end
		return result
	end
	def length(array)
		array.size
	end

	def fibonacci(n)
		return 0 if n == 0
		return 1 if n == 1

		@fibonacci_cache ||= {}
		@fibonacci_cache[n] = (fibonacci(n-1) + fibonacci(n-2))
	end
end




describe "Numermaster" do
	before do
		@numer = Numermaster.new
	end
	describe "#watershed" do
	it "should print positive numbers when the are the majority" do
		expect(@numer.watershed([1,2,4,56,-23,-56456,-112])).to eq([1,2,4,56])
		end
	end
	describe "#watershed" do
	it "should return an empty array when passed empty array" do
		expect(@numer.watershed([])).to eq([])
		end
	end

	describe "#mean" do
		it "should return the mean of the array" do
			expect(@numer.mean([1,2,3,3,4,5,5,6])).to eq(3)
		end
	end
	describe "#median" do
		it "should return the median of the array" do
			expect(@numer.median([1,2,3,3,4,5,5,6])).to eq(3.5)
		end
		it "should return the median of an even array" do
			expect(@numer.median([1,2,3,3,4,5,5,6])).to eq(3.5)
		end
	end
	describe "#mode" do
		it "should return the mode of the array" do
			expect(@numer.mode([1,2,3,3,4,5,5,6])).to eq([3,5])
		end
		it "should return two modes when two exist in the array" do
			expect(@numer.mode([1,2,3,3,4,5,5,6])).to eq([3,5])
		end
	end
	describe "#length" do
		it "should return the length of the array" do
			expect(@numer.length([1,2,3,3,4,5,5,6])).to eq(8)
		end
	end
	describe "#averages" do
		it "should return an array of averages" do
			expect(@numer.averages([1,2,3,3,4,5,5,6])).to eq([3,3.5,[3,5],8])
		end
	end

end