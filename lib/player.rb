require 'pry'

class Player
    attr_accessor :user_name, :life_points
    @@enemies = []
    
    def initialize(name) # is executed for each new instance in "Player class"
        @user_name = name
        @life_points = 10
        @@enemies << self
    end

    # def self.all_enemies
    #     return @@enemies
    # end

    def show_state # gives the life_points status of a given user.
        puts "#{@user_name} a #{@life_points} points de vie restants\n"
    end

    def get_damages(damages) # when player recieves damage from attacks
        @life_points -= damages
        puts "\e[31mIl lui inflige #{damages} points de dégâts\e[0m."
        if @life_points <= 0
            @life_points = 0
        end
        return damages
    end

    def attack(defender) 
        puts "\n\e[33mLe joueur #{@user_name} attaque le joueur #{defender.user_name}\e[0m"
        defender.get_damages(compute_damage)
    end

    def compute_damage
        return rand(1..6)        
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level, :user_name 

    def initialize(name)
        @life_points = 100
        @user_name = name
        @weapon_level = 1
    end

    def show_state # gives the life_points status of a given user.
        puts "#{@user_name} a #{@life_points} points de vie restants et une arme de niveau #{@weapon_level}.\n"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end
    
    def search_weapon
        lvl_wp = rand(1..6)
        puts "AMAZING! Tu as trouvé une arme ︻╦╤─ de niveau #{lvl_wp}!"
            if lvl_wp > @weapon_level
                @weapon_level = lvl_wp
                puts "Cette arme est plus puissante tu la garde"
            else 
                puts "Cette arme n'a aucun intéret."
            end
        return lvl_wp
    end

    def search_health_pack
        draw = rand(1..6)
        if draw == 1
            puts "Tu n'as rien trouvé Morray... "
        elsif draw >= 2 && draw <= 5
            @life_points += 50
            puts "Tu viens de trouver de la potion magique, +50 points"
        else
        @life_points += 80
            puts "WTF, tu gagnes +80 points"
            if (life_points >= 100)
                @life_points = 100
                puts "Cependant, tu ne peux pas aller plus haut que ton verre, ta jauge reste a 100 points"
            end
        end
    end           
end