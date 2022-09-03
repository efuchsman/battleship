require 'rspec'
require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'
require './lib/player.rb'
require 'pry'
require 'pry-nav'

RSpec.describe Player do
  it 'exists' do
    fleet = Ship.new('Cruiser', 3)
   player = Player.new(fleet)

    expect(player).to be_an_instance_of(Player)
    end
  describe 'fleet' do
    it 'has a fleet of multiple ships' do
      cruiser = Ship.new('Cruiser', 3)
      submarine = Ship.new('Submarine', 2)
      fleet = [cruiser, submarine]
      player = Player.new(fleet)

      expect(player.fleet).to eq([cruiser, submarine])
    end

    it 'can check the health of the ships in the fleet' do
      cruiser = Ship.new('Cruiser', 3)
      submarine = Ship.new('Submarine', 2)
      fleet = [cruiser, submarine]
      player = Player.new(fleet)

      expect(player.health_of_ship_at(0)).to eq(3)
      expect(player.health_of_ship_at(1)).to eq(2)

      cruiser.hit

      expect(player.health_of_ship_at(0)).to eq(2)


    end

  end


  end
