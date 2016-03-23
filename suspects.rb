class Suspect
  attr_accessor :name, :gender, :skin, :hair, :eye

  def initialize(name, gender, skin, hair, eye)
    @name = name
    @gender = gender
    @skin = skin
    @hair = hair
    @eye = eye
    @suspect = []
  end
end

class Game
  attr_accessor :suspects, :new_suspects, :count, :attribute, :type, :all_options

  def initialize
    @suspects = []
    @new_suspects = []
    @count = 0
    play
  end

  def play
    welcome
    create_suspects
    create_new_suspects
    choose_suspect
    display_initial_suspects
    game_loop
  end

  def game_loop
    if @count < 4
      guess_attribute
      attribute_check
      attribute_suspect_match
      display_remaining_suspects
      guess_suspect
    end
  end

  def welcome
    puts "Let's play Guess Who! Here are your possible suspects:"
    puts "------------------------------------------------------------"
  end

  def choose_suspect
    @suspect = suspects.sort_by { rand }.first
  end

  def display_initial_suspects
    suspects.each do |x|
      puts x.name 
    end
  end

  def display_remaining_suspects
    puts "There are #{@new_suspects.length} suspects remaining."
    puts "--------------------------------------------------------"
    new_suspects.each do |x|
    puts x.name
    end
  end

  def guess_suspect
    puts " "
    puts "Please guess a suspect."
    @guessed_suspect = gets.chomp.downcase
    @count += 1
      if @count < 4
        if @suspect.name == @guessed_suspect
          puts "You guessed who! It was #{@suspect.name}."
          puts " "
          @count += 5
        else
          if @count < 3
           puts "Unfortunately, #{@guessed_suspect} is not the suspect."
           puts " "
           suspect_wrong_guess
          else
           puts "Unfortuately, #{@guessed_suspect} is not the suspect, it was #{@suspect.name}. You lose."
           puts " "
          end
        end
      else
      end
  end

  def guess_attribute
      puts " "
      puts "please choose one of the following: gender, skin, hair, eye."
      @attribute = gets.chomp.downcase
      @all_options = ["gender boy", "gender girl", "skin black", "skin white", "hair auburn", "hair black", "hair blonde", "hair brown", "eye blue", "eye brown", "eye green"]
      case
      when attribute == "gender"
        puts " "
        puts "please choose boy or girl."
        @type = gets.chomp.downcase
      when attribute == "skin"
        puts " "
        puts "please choose black or white."
        @type = gets.chomp.downcase
      when attribute == "hair"
        puts " "
        puts "please choose one of the following: auburn, black, blonde or brown."
        @type = gets.chomp.downcase
      when attribute == "eye"
        puts " "
        puts "please choose one of the following: blue, brown or green."
        @type = gets.chomp.downcase
      end
  end

  def attribute_check
    if all_options.include?("#{attribute} #{type}") == false
      puts "please try again."
      guess_attribute
    end
  end

  def accurate_attribute_guess
    puts "The suspect's #{attribute} is #{type}."
  end

  def wrong_attribute_guess
    puts "The suspect's #{attribute} is not #{type}."
  end

  def attribute_suspect_match
    case
    when attribute == "gender"
      if @suspect.gender == type
        new_suspects_match
        accurate_attribute_guess
      else
        new_suspects_not_match
        wrong_attribute_guess
      end
    when attribute == "skin"
      if @suspect.skin == type
        new_suspects_match
        accurate_attribute_guess
      else
        new_suspects_not_match
        wrong_attribute_guess
      end  
    when attribute == "hair"
      if @suspect.hair == type
        new_suspects_match
        accurate_attribute_guess
      else
        new_suspects_not_match
        wrong_attribute_guess
      end 
    when attribute == "eye"
      if @suspect.eye == type
        new_suspects_match
        accurate_attribute_guess
      else
        new_suspects_not_match
        wrong_attribute_guess
      end
    end
  end

  def new_suspects_match
    @new_suspects = new_suspects.select do |x|
      if attribute == "gender"
        x.gender == type
      elsif attribute == "skin"
        x.skin == type
      elsif attribute == "hair"
        x.hair == type
      elsif attribute == "eye"
        x.eye == type
      end
    end
  end   

  def new_suspects_not_match
    @new_suspects = new_suspects.select do |x|
      if attribute == "gender"
        x.gender != type
      elsif attribute == "skin"
        x.skin != type
      elsif attribute == "hair"
        x.hair != type
      elsif attribute == "eye"
        x.eye != type
      end
    end
  end   

  def suspect_wrong_guess
    @new_suspects = new_suspects.select do |x|
      x.name != @guessed_suspect
    end
  end

  def create_new_suspects
    @new_suspects = @suspects
  end

  def create_suspects

    suspects << Suspect.new("rachel", "girl", "black", "auburn", "brown")
    suspects << Suspect.new("mac", "boy", "white", "black", "brown")
    suspects << Suspect.new("nick", "boy", "white", "brown", "blue")
    suspects << Suspect.new("angie", "girl", "white", "auburn", "green")
    suspects << Suspect.new("theo", "boy", "white", "blonde", "brown")
    suspects << Suspect.new("joshua", "boy", "white", "black", "brown")
    suspects << Suspect.new("emily", "girl", "white", "blonde", "blue")
    suspects << Suspect.new("jason", "boy", "white", "blonde", "green")
    suspects << Suspect.new("john", "boy", "white", "brown", "blue")
    suspects << Suspect.new("grace", "girl", "black", "black", "brown")
    suspects << Suspect.new("jake", "boy", "white", "brown", "brown")
    suspects << Suspect.new("megan", "girl", "white", "blonde", "green")
    suspects << Suspect.new("ryan", "boy", "white", "auburn", "brown")
    suspects << Suspect.new("brando", "boy", "white", "blonde", "brown")
    suspects << Suspect.new("beth", "girl", "white", "blonde", "brown")
    suspects << Suspect.new("diane", "girl", "black", "brown", "brown")
    suspects << Suspect.new("chris", "boy", "white", "black", "green")
    suspects << Suspect.new("david", "boy", "black", "black", "brown")
    suspects << Suspect.new("michelle", "girl", "black", "brown", "brown")
    suspects << Suspect.new("tyson", "boy", "black", "black", "brown")
    suspects << Suspect.new("ursula", "girl", "white", "auburn", "green")
  end
end

Game.new