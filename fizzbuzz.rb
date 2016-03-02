numbers = [3, 15, 33]

numbers.each do |number| 
	if number % 33
		puts "fizzbuzz"

	elsif number % 3
		puts "fizz"

	elsif number % 15
		puts "buzz"
	end	
end