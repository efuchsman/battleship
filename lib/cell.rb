class Cell

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fire = false
    end

    def ship
        @ship
    end

    def empty?
        if ship == nil
            true
        else
            false
        end
    end

    def place_ship(ship_type)
        @ship = ship_type
    end

    def fired_upon?
        @fire
    end

    def fire_upon
        if @ship == nil 
            @fire = true
        elsif @ship != nil
            @ship.hit 
            @fire = true 
        end
    end

end
