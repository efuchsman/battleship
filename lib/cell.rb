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

    def place_ship(ship)
        @ship = ship
    end

    def fired_upon?
        @fire
    end

    def render(visible = false)

        if @ship!= nil && @ship.sunk? == true
            @render = "X"
        elsif @ship != nil && @fire == true && @ship.sunk? == false
            @render = "H"
        elsif visible == true && @ship != nil
            @render = "S"
        elsif @ship == nil && @fire == true
            @render = "M"
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
