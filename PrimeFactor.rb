require "prime"

def primeFactor(num)
    last_prime = num.prime_division.last
    last_prime[0]
end

puts primeFactor(600851475143)