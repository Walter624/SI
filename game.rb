class Game
  attr_accessor :hero, :rooms, :scenarios
  def initialize
    @hero = Hero.new
    @rooms = 10
    @scenarios = ["medicine", "enemy", "nothing"]
    start_game
  end

  def start_game
    puts 'Welcome to the Haunted House.'
    enter_room
  end

  def random_scenario
    scenario = scenarios.shuffle.last
    case scenario
    when "medicine"
      medicine
    when "enemy"
      enemy
    when "nothing"
      nothing
    end
  end

  def enter_room
    while rooms > 0 do
       if hero.health <= 0
         puts "You died! Play again!"
         break
       end
      puts "There are #{rooms} rooms left. Choose door 1 or door 2"
      choice = gets.chomp
      if choice == '1'
        random_scenario
      elsif choice == '2'
        random_scenario
      else
        break
      end
    end
  end

  def medicine
    puts "You picked up medicine!"
    self.hero.health += 50
    puts "You now have #{hero.health} health"
    self.rooms -= 1
  end

  def enemy
    enemy = Enemy.new
    puts "There's an #{enemy.name} with #{enemy.health} health here! Fight~"

    while true do
      puts "#{enemy.name} deals #{enemy.damage} of damage to you"
      self.hero.health -= enemy.damage
      puts "You have #{hero.health} health left "
      break if hero.health <= 0

      puts ""
      puts "-------------------------"
      puts "You dealt #{hero.damage} damage to the #{enemy.name}"
      enemy.health -= hero.damage
      puts "The #{enemy.name} has #{enemy.health} left"

      if enemy.health <= 0
        puts "You killed the #{enemy.name}! On to the next room!"
        break
      end
      puts "-------------------------"
    end
    self.rooms -= 1
  end

  def nothing
    puts "There is nothing in here!"
    self.rooms -= 1
  end
end


class Enemy
  attr_accessor :health, :name, :damage
  def initialize
    @name = ["Gore", "Troll", "Zombie"].sample
    @health = [100, 200, 300].sample
    @damage = [25, 50, 75].sample
  end
end

class Hero
  attr_reader :name, :damage
  attr_accessor :health
  def initialize
    @name = "Hero"
    @health = 100
    @damage = 50
  end
end

Game.new