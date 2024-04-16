require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Pikatchu")
player2 = Player.new("Miaous")
round = 1


while (player1.life_points >= 0) || (player2.life_points >= 0) 
    puts "\n\e[35mRound ##{round}, fight!\e[0m\n"
    player1.attack(player2)
    player1.show_state
    player2.show_state
    if player2.life_points <= 0
        puts ""
        puts "============================="
        puts "> #{player2.user_name} est mort 🪦 "
        puts "============================="
        break
    end
    puts "--------------"
    sleep 0.8
    player2.attack(player1)
    player1.show_state
    player2.show_state
    if player1.life_points <= 0
        puts ""
        puts "============================="
        puts "#{player1.user_name} est mort 🪦"
        puts "============================="
      break
    end
    round+=1
    sleep 1.5
end
puts ""
#binding.pry
