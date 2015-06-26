# SL8. The calculator

# We’ll start with something nice and easy so we learn this testing thing quickly.

# Write a class, called Calculator, that basically performs all four basic math operations: addition, substraction, multiplication and
# division. In order to keep it simple, all of them will have two numeric parameters.

# After writing your class, write several tests. For each one, print “OK” if it succeeded, “FAIL” otherwise, in order to test that
# everything is working out properly.




class Calculator
  attr_accessor :numbers

  def addition(a, b)
  	return a + b
  end

  def subtraction(a, b)
  	return a - b
  end

  def multiplication(a, b)
  	return a * b
  end

  def division(a, b)
  	return a / b
  end

  def median
  	if numbers.length.odd?
  		sorted_array = numbers.sort
  		middle = numbers / 2
  		sorted_array[middle]

  	elsif numbers.length.even?
  		sorted = numbers.sort
    	mid = (sorted.length - 1) / 2
    	(sorted[mid.floor] + sorted[mid.ceil]) / 2
  	end
  end
end


# Prepare numerifier
puts "===LET'S TEST SOME STUFF==="
calculator1 = Calculator.new

#Test 1
print "Testing addition "
if calculator1.addition(2, 5) == 7
	print 'OK'
else
	print 'FAIL'
end
print "\n"

#Test 2
print "Testing subtraction "
if calculator1.subtraction(19, 20) == -1
	print 'OK'
else
	print 'FAIL'
end
print "\n"

#Test 3
print "Testing multiplication "
if calculator1.multiplication(6, 6) == 36
	print 'OK'
else
	print 'FAIL'
end
print "\n"

#Test 4
print "Testing division "
if calculator1.division(10, 5) == 2
	print 'OK'
else
	print 'FAIL'
end
print "\n"

#Test 5
print "Testing median "
calculator1.numbers = [1, 17, 21, 55, 30, 2]
if calculator1.median == 19
	print 'OK'
else
	print 'FAIL'
end
print "\n"