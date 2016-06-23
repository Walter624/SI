def mad_lib
	puts "Lets write a story together but we are missing some words help fill them out:"
	puts " "
	puts "Type in a name and press enter"
	name = gets.chomp
	puts "Type in a animal and press enter"
	animal = gets.chomp
	puts "Type in an adjective and press enter"
	adj = gets.chomp
	puts "Type in another adjective and press enter"
	adj_2 = gets.chomp
	puts "Type in a noun and press enter"
	noun = gets.chomp
	puts "Type in a verb and press enter"
	verb = gets.chomp
	puts "Type in another verb and press enter"
	verb_2 = gets.chomp
	puts "Type in a past-tense verb and press enter"
	past_verb = gets.chomp


	puts "Here's the finished story Good Job!:"
	puts " "
	puts "THE SHORT STORY"
	puts "---------------"
	puts "A long time ago there was a someone named " + name + " who lived in the forest with a(n) " + adj + " " + animal + ".  He/She was forced to " + verb + " all day  while the " + animal + " sat around " + verb_2 + "ing." 
	puts ""
	puts "But then one day" + name + "found a magic " + noun + ". When " + name +" picked up the " + noun + ", he/she found that anything he/she imagined came true. Soon, " + name + " was making the " + animal + " " + verb + " while he/she choose to sit around and " + verb_2 +"." 
	puts ""
	puts "After a while, he/she realized this was not a very " + adj_2 + " thing to do and released the " + animal + " from his/her spell. They became best friends and " + past_verb + " every day." 
end

mad_lib