class Board
    attr_reader :coordinate_keys, :cell_hash

    def initialize
        @coordinate_keys = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
        @cell_hash = cells
    end

    def cells
        hash = {}
        @coordinate_keys.each do |key|
            hash[key] = Cell.new(key)
        end
        hash
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
        valid_coordinate?(coordinate)
        c_ord = coordinate.ord
        coord_ord << c_ord
        new_val = coordinate.chars.last.to_i

        if valid_coordinate?(coordinate) != true
          return false
        end

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

    def valid_vertical?(coordinates)
      old_coord_ord = nil
      integ_val_arr = []

      coordinates.each do |coordinate|
        valid_coordinate?(coordinate)
        new_coord_ord = coordinate.ord
        integ_value = coordinate.chars.last.to_i
        integ_val_arr << integ_value

        if valid_coordinate?(coordinate) != true
          return false
        end

      if old_coord_ord == nil || new_coord_ord - old_coord_ord ==1
        old_coord_ord = new_coord_ord
      elsif new_coord_ord - old_coord_ord != 1
        return false
      end
    end

      if integ_val_arr.max != integ_val_arr.min
        return false
      end
      true
    end

    def valid_placement?(ship, coordinates)
      if valid_length?(ship, coordinates) != true || (valid_horizontal?(coordinates) || valid_vertical?(coordinates)) != true || overlapping_placement?(coordinates) == true
        return false
      end
      true
    end

    def overlapping_placement?(coordinates)
      coordinates.each do |coordinate|
        cell = cell_hash[coordinate]
        if cell.empty? != true
          return true
        end
        false
      end
    end

    def place(ship, coordinates)
      if valid_placement?(ship, coordinates) != true
        return "invalid placement"
      else
        coordinates.each do |coordinate|
          cell = @cell_hash[coordinate]
          cell.place_ship(ship)
        end
      end
    end

    def render
      num_col = "  1 2 3 4 \n"
     rows = [
       ["A1","A2", "A3", "A4"],
       ["B1", "B2", "B3", "B4"],
       ["C1", "C2", "C3", "C4"],
       ["D1", "D2", "D3", "D4"]]
      rows.each do |row|
        num_col += row.first.chars.first + " "
        row.each do |key|
          num_col +=  cells[key].render + " "
        end
      end
      num_col += "\n"
    end

    def render(visible = true)
      num_col_vis = "  1 2 3 4 \n"
      rows = [
        ["A1","A2", "A3", "A4"],
        ["B1", "B2", "B3", "B4"],
        ["C1", "C2", "C3", "C4"],
        ["D1", "D2", "D3", "D4"]]
       rows.each do |row|
         num_col_vis += row.first.chars.first + " "
         row.each do |key|
           num_col_vis +=  cells[key].render(true) + " "
         end
       end
       num_col_vis += "\n"
    end



end
