require 'rspec'
require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'
require './lib/player.rb'
require './lib/game.rb'
require 'pry'
require 'pry-nav'

RSpec.describe Game do
  it 'exists' do
    cruiser_1 = Ship.new('Cruiser', 3)
    cruiser_2 = Ship.new('Cruiser', 3)
    submarine_1 = Ship.new('Submarine', 2)
    submarine_2 = Ship.new('Submarine', 2)
    fleet_1 = [cruiser_1, submarine_1]
    fleet_2 = [cruiser_2, submarine_2]
    player_1 = Player.new(fleet_1)
    computer = Player.new(fleet_2)
    game = Game.new(player_1, computer)

    expect(game).to be_an_instance_of(Game)
  end
end
