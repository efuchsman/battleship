class Ship
attr_reader :name, :ship_length
    def initialize(name, ship_length)
        @name = name
        @ship_length = ship_length
    end

    def health
        @ship_length
    end






end
