class Cell

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
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

end
