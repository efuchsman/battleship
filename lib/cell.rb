class Cell
    attr_reader :coordinate, :ship, :fire, :render

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fire = false
        @render = "•"
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

    def render(visible = false)

        if visible == true && @ship != nil
            @render = "S"
        elsif @ship == nil && @fire == true
            @render = "M"
        elsif @ship != nil && @fire == true && @ship.sunk? == false
            @render = "H"
        elsif @ship!= nil && @ship.sunk? == true
            @render = "X"
        else
            @render
        end
    end

    def fire_upon
            @fire = true
        if @ship != nil
            @ship.hit
        end
    end

end
