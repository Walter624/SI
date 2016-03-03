def ask_name
    puts "What is your name?"
    name = gets.chomp
    puts "what year where you born?"
    year = gets.chomp

    puts name + " was born in " + year
end

ask_name