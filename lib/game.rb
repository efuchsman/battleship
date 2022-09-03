class Game
  attr_reader :player_1, :computer

  def initialize(player_1, computer)
    @player_1 = player_1
    @computer = computer

  end


  def start
    p "Welcome to BATTLESHIP"
    p "Enter 'p' to play. Enter 'q' to quit."

    user = gets.chomp.downcase

    if user == 'q'
    elsif user == 'p'
      computer_place_ships(@computer.fleet, @computer.board.coordinate_keys)
      play
    else
      'Please read the directions!'
    end
  end

  def computer_place_ships(fleet, coordinates)
    board = @computer.board
    fleet.each do |ship|
      selected_coords = coordinates.each_cons(ship.ship_length).to_a.sample
      board.place(ship, selected_coords)
    end
    p @computer.board.render_player(true)
  end

  # def play
  #   until player_1.has_lost? || computer.has_lost?

  #   end
  # end

end
