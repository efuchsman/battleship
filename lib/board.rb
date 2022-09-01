class Board
    attr_reader :coordinate_keys

    def initialize
        @coordinate_keys = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    end

    def cells
        cells_hash = {}
        @coordinate_keys.each do |key|
            cells_hash[key] = Cell.new(key)
        end
        cells_hash
    end

    def valid_coordinate?(coordinate)
        @coordinate_keys.include?(coordinate)
    end

    def valid_length?(ship, coordinates)
        @ship = ship 
        ship.ship_length == coordinates.count
    end
end
