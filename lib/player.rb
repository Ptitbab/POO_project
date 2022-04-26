#require 'pry'

class Player
    attr_accessor :name, :life_points
    @@all_player = []

    def initialize(name_to_update)
        @name = name_to_update
        @life_points = 10
        @@all_player << self
    end

    def show_state
        p "#{name} a #{life_points} points de vie"
    end

    def gets_damage(damage_to_take)
        @life_points -= damage_to_take
        if @life_points <= 0
            p "Le joueur #{name} a été tué!"
        end
    end

    def attacks(player_to_attack)
        p "Le joueur #{name} attaque le joueur #{player_to_attack.name}"
        damage_to_inflict = compute_damage
        puts "Le joueur #{name} inflige #{damage_to_inflict} points de dommages."
        player_to_attack.gets_damage(damage_to_inflict)
    end

    def compute_damage
        rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name_to_update)
        @weapon_level = 1
        @life_points = 100

        super(name_to_update)
    end

    def show_state
        p "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}."
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        weapon_level_found = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{weapon_level_found}"
        if weapon_level_found > weapon_level
            weapon_level = weapon_level_found
            puts "Youhou ! Elle est meilleure que ton arme actuelle: tu la prends."
        else
            puts "Merde...elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        number = rand(1..6)
        if number == 1
            puts "Tu n'as rien trouvé"
        elsif number >= 2 and number <= 5
            @life_points += 50
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        else 
            @life_points += 80
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
    end
end

#binding(pry)
