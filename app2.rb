require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
puts ""

puts ""

def display_ascii_start 
  puts File.read("lib/ascii_start.txt")
end

display_ascii_start

puts "select your character:"
name = gets.chomp

human_player = HumanPlayer.new(name)
bot1 = Player.new("Josiane")
bot2 = Player.new("Jose")

while human_player.life_points > 0 && (bot1.life_points > 0 || bot2.life_points >0)
  arr_menu =  ["Quelle action veux-tu effectuer ?","a - chercher une meilleure arme","s - chercher à se soigner","attaquer un bot:","0 - Josianne a #{bot1.life_points} points de vie","1 - José a #{bot2.life_points} points de vie"]

  puts ""
  puts arr_menu
  # Action utilisateur
  user_action = gets.chomp
  case user_action
  when "a"
    human_player.search_weapon
  when "s"
    human_player.search_health_pack
  when "0"
    human_player.attack(bot1)
  when "1"
    human_player.attack(bot2)
  end
    if (bot1.life_points == 0) && (bot2.life_points == 0)
        puts "Congrats, you defeated the bots"
        break
    end
  sleep 1
  puts "--------------"
    bot1.attack(human_player)
    sleep 0.5
    human_player.show_state
    sleep 0.5
    bot2.attack(human_player)
    sleep 0.5
    human_player.show_state
  if human_player.life_points == 0
    puts "Bots (⌐■_■) just killed you d[-_-]b you lost, loser"
    break
  end
end

def display_ascii_end
  puts File.read("lib/ascii_end.txt")
end

display_ascii_end
# binding.pry