require 'rspec'
require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'
require './lib/player.rb'
require 'pry'


RSpec.describe Player do
  it 'exists' do
    fleet = Ship.new('Cruiser', 3)
    board = Board.new
   player = Player.new(fleet, board)


    expect(player).to be_an_instance_of(Player)
  end
  describe 'fleet' do
    it 'has a fleet of multiple ships' do
      cruiser = Ship.new('Cruiser', 3)
      submarine = Ship.new('Submarine', 2)
      fleet = [cruiser, submarine]
      board =Board.new
      player = Player.new(fleet, board)

      expect(player.fleet).to eq([cruiser, submarine])
    end

    it 'can place its fleet on the board' do
      cruiser = Ship.new('Cruiser', 3)
      submarine = Ship.new('Submarine', 2)
      fleet = [cruiser, submarine]
      board =Board.new
      player = Player.new(fleet, board)

      board.place(cruiser, ["A1", "A2", "A3"])
      board.place(submarine, ["C2", "D2"])

      expect(player.board.render_player(true)).to eq("  1 2 3 4 \nA S S S • \nB • • • • \nC • S • • \nD • S • • \n")

    end

    it 'can check the health of the ships in the fleet' do
      cruiser = Ship.new('Cruiser', 3)
      submarine = Ship.new('Submarine', 2)
      fleet = [cruiser, submarine]
      board = Board.new
      player = Player.new(fleet)

      expect(player.health_of_ship_at(0)).to eq(3)
      expect(player.health_of_ship_at(1)).to eq(2)

      cruiser.hit

      expect(player.health_of_ship_at(0)).to eq(2)
    end

    it 'true if the player has lost the game' do
      cruiser = Ship.new('Cruiser', 3)
      submarine = Ship.new('Submarine', 2)
      fleet = [cruiser, submarine]
      player = Player.new(fleet)

      cruiser.hit
      submarine.hit

      expect(player.has_lost?).to be false

      cruiser.hit
      submarine.hit

      expect(player.has_lost?).to be false
      expect(submarine.sunk?).to be true

      cruiser.hit

      expect(cruiser.sunk?).to be true
      expect(player.has_lost?).to be true

    end
   end
end
