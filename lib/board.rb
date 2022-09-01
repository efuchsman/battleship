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

    def valid_horizontal?(coordinates)
      coord_ord = []
      old_coord_val = nil

      coordinates.each do|coordinate|
        c_ord = coordinate.ord
        coord_ord << c_ord

        new_val = coordinate.chars.last.to_i
        if old_coord_val == nil || new_val - old_coord_val == 1
          old_coord_val = new_val
        elsif new_val - old_coord_val != 1
          return false
        end
      end

      if coord_ord.max != coord_ord.min
        return false
      end
      true
    end



end
