require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-----------------------------------------------------"
puts "|Bienvenue sur 'IL VEULENT TOUS MA POO !             |"
puts "|Le but du jeu est d'être le dernier survivant !     |"
puts "-----------------------------------------------------"

puts "Quel est ton nom?"

nom_joueur = gets.chomp

player1 = HumanPlayer.new("#{nom_joueur}")

ennemy1 = Player.new("José")
ennemy2 = Player.new("Bab")