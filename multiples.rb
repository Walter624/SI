def multiples
  numbers = Array(1..999)
  multiples = Array.new
  for i in numbers
    if i%3 == 0 or i%5 == 0
      multiples.push(i)
    end
  end
  multiples
end

puts multiples