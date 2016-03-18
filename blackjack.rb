class BlackJack

	attr_accessor :player, :dealer, :deck, :current_game, :games_played

	def initialize
		@player = Player.new
		@dealer = Dealer.new
		@games_played = 0
		welcome
	end

	def game_money
		shuffle_deck
		betting
		deal_cards
		show_hands
		player_and_dealer_take_turns
	end

	def welcome
		puts "Hi, #{player.name}. Would you like to play Yes/No"
		choice = gets.chomp.downcase
		case choice
		when choice = "yes"
			puts "Let's play!"
			@current_game = "yes"
			puts "Add money to your bank roll?"
			starting_bank_roll = gets.chomp.to_i
				case 
				when starting_bank_roll.class == Fixnum
					if starting_bank_roll > 0 
						player.bank_roll = starting_bank_roll
						game_money
					elsif starting_bank_roll < 1
						puts "Please enter an amount of at least $1."
						welcome
					else
					end
				else
					puts "Please enter a whole number."
					welcome
				end
		when choice = "no"
			puts "Ok Try again later #{player.name}."
			games_played_update
		else
			puts "Sorry, please type either Yes or No."
			welcome
		end

	end

	def continue
		puts "Would you like to play again? (Y/N)"
			choice = gets.chomp.downcase.to_s
			case choice
			when choice = "y"
				if current_game
					game_money
				end
			when choice = "n"
				puts "Thanks for playing #{player.name}."
				games_played_update
			else
				puts "Please type either Y or N."
				continue
			end
	end

	def show_hands
		show_player_hand
		show_dealer_initial_hand
	end

	def games_played_update
		puts "How many games played: #{games_played}"
	end

	def deal_cards
		player.hand.clear
		dealer.hand.clear
		2.times do
			deal_to_player
			deal_to_dealer
		end
	end

	def dealer_turn
		show_dealer_full_hand
		if dealer.check_for_21 == true
			determine_winner
		else
			count = 0
			while count < 1
				if dealer.check_if_dealer_hits == true
					deal_to_dealer
					case 
					when dealer.check_for_21 == true
						puts "The dealer hit"
						puts show_dealer_full_hand
						determine_winner
						count += 1
					when dealer.check_for_bust == true
						puts "The dealer hit"
						puts show_dealer_full_hand
						determine_winner
						count += 1
					else
						puts "The dealer hit"
						puts show_dealer_full_hand
						count += 0
					end
				else
					determine_winner
					count += 1
						
				end
			end
		end
	end
	
	def player_and_dealer_take_turns
		if dealer.check_for_21 == true
			puts "The dealer has 21, #{show_dealer_full_hand}."
			determine_winner
		end
		count = 0
		while count < 1
			puts "You have #{player.card_total}. #{player.hand}. Would you like to hit or stay? (hit/stay)"
			decision = gets.chomp
			case decision.downcase
			when "stay"
				count += 1
				dealer_turn
			when "hit"
				deal_to_player
				show_player_hand
				if player.check_for_21 == true
					puts "You hit 21."
					count += 1
					dealer_turn
				elsif player.check_for_bust == true
					determine_winner
					count += 1
				else 
					count += 0
				end
			else
				puts "Sorry, please type either hit or stay."
			end
		end
	end
				
	def bank_roll_empty_check
		if player.bank_roll < 1
			puts "Game Over #{player.name}, you are out of money. Thanks for playing."		
			games_played_update
		else
			puts player.bank_roll_status
			continue
		end
	end

	def determine_winner
		determine_winner_bank
	end

	def determine_winner_bank
		case
		when player.card_total > 21
			puts "Your hand: #{player.card_total} has busted."
			player.bank_roll -= player.wager
			bank_roll_empty_check
		when dealer.card_total > 21
			puts "The dealer has lost: #{dealer.card_total} and has busted. You win!"	
			player.bank_roll += player.wager
			bank_roll_empty_check
		when player.card_total == dealer.card_total
			puts "It's a push. You and the dealer both have #{player.card_total}."
			player.bank_roll += 0
			bank_roll_empty_check
		when player.card_total > dealer.card_total
			puts "You win! Your #{player.card_total} beat the dealer's #{dealer.card_total}."
			player.bank_roll += player.wager
			bank_roll_empty_check
		when player.card_total < dealer.card_total
			puts "You lost. The dealer's #{dealer.card_total} beat your #{player.card_total}."
			player.bank_roll -= player.wager
			bank_roll_empty_check
		else
			puts "Something went wrong try again."
		end
	end

	def betting
		puts "Place Your Bets!!"
		player.wager = gets.chomp.to_i
		case 
		when player.wager.class == Fixnum
			if player.wager > player.bank_roll
				puts "Enter an amount less than or equal to your total bank roll of #{player.bank_roll}."
				betting
			elsif player.wager < 1
				puts "Please enter a wager of at least $1."
				betting
			else
			end
		else 
			puts "Please enter a valid wager amount."
		end
	end

	def show_player_hand
		puts "player hand: #{player.card_total}, #{player.hand}"
	end

	def show_dealer_initial_hand
		puts "dealer hand: [#{dealer.hand.last}]"
	end

	def show_dealer_full_hand
		puts "dealer hand: #{dealer.card_total}, #{dealer.hand}"
	end
	
	def new_pack
		@new_pack = (([1,2,3,4,5,6,7,8,9] * 4) + ([10] * 16))
	end

	def shuffle_deck
		@deck = new_pack.shuffle!
		@games_played += 1
	end

	def deal_to_player
		player.hand << deck.pop
	end

	def deal_to_dealer
		dealer.hand << deck.pop
	end

end

class Dealer

	attr_reader :hand

	def initialize
		@hand = []
	end

	def check_for_21
		card_total == 21
	end

	def check_for_bust
		card_total > 21
	end

	def check_if_dealer_hits
		card_total < 17
	end

	def card_total
		hand.inject(:+)
	end

end

class Player

	attr_reader :name, :hand
	attr_accessor :bank_roll, :wager

	def initialize
		get_players_name
		@hand = []
		@bank_roll = 0
		@wager = 0
	end

	def check_for_21
		card_total == 21
	end

	def check_for_bust
		card_total > 21
	end

	def get_players_name
		puts "Hello, welcome to the blackjack table. What is your name?"
		@name = gets.chomp
	end

	def card_total
		hand.inject(:+)
	end

	def bank_roll_status
		puts "You have $#{bank_roll} in your bank roll."
	end

end

BlackJack.new