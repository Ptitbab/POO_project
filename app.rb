require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("José")
player2 = Player.new("Bab")

while player1.life_points > 0 and player2.life_points > 0
    puts "Voici l'état de chaque joueur:"

    player1.show_state
    player2.show_state

    puts "\n\n"

    puts "Passons à la phase d'attaque:"
    player1.attacks(player2)
    break if player2.life_points <= 0
    player2.attacks(player1)
    puts "\n\n"
end

#binding(pry)