require 'rspec'
require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'
require './lib/player.rb'
require 'pry'
require 'pry-nav'

RSpec.describe Player do
  it 'exists' do
    ship = Ship.new('Cruiser', 3)
   player = Player.new(player, ship)

    expect(player).to be_an_instance_of(Player)
    end
  end
