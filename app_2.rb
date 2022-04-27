require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-----------------------------------------------------"
puts "|Bienvenue sur 'IL VEULENT TOUS MA POO !             |"
puts "|Le but du jeu est d'être le dernier survivant !     |"
puts "-----------------------------------------------------"

puts "Quel est ton nom?"

user_name = gets.chomp

user = HumanPlayer.new("#{user_name}")

player1 = Player.new("José")
player2 = Player.new("Bab")

while user.life_points > 0 && (player1.life_points > 0 ||player2.life_points > 0)

    puts "Quelle action veux-tu effectuer?\n\n"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner\n\n"
    puts "attaquer un joueur en vue :"
    puts "0 - José a #{player1.life_points} points de vie" 
    puts "1 - Bab a #{player2.life_points} points de vie" 

    action_choice = gets.chomp
    
    if action_choice == "a"
        user.search_weapon
    elsif action_choice == "s"
        user.search_health_pack
    elsif action_choice == 0
        user.attacks(player1)
    elsif action_choice == 1
        user.attacks(player2)
    else 
        "Choose one of the options"
    end

    puts "\n\nLes autres joueurs t'attaquent:"

    player1.attacks(user)
    player1.attacks(user)


end

if user.life_points > 0
    puts "Bravo tu as gagné!"
else
    puts "Loser! Tu as perdu!"
end