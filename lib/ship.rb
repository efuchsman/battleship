class Ship
attr_reader :name, :ship_length
    def initialize(name, ship_length)
        @name = name
        @ship_length = ship_length
    end

    def health
        @ship_length
    end

    def sunk?
        if @ship_length == 0
            true
        else
            false
        end
    end

    def hit
        @ship_length -= 1
    end

end
