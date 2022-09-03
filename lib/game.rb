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
      p "Enter the squares for the Cruiser (3 spaces):"
      player_1_cruiser_coords = gets.chomp.upcase.split

      @player_1.board.place(@player_1.fleet[0],player_1_cruiser_coords)

      p @player_1.board.render_player(true)
      # play
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
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is three units long and the Submarine is two units long."
    p @computer.board.render
  end

  # def play
  #   until player_1.has_lost? || computer.has_lost?

  #   end
  # end

end
