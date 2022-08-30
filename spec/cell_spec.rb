require 'rspec'
require './lib/ship.rb'
require './lib/cell.rb'
require 'pry'

RSpec.describe Cell do
    it 'exists' do
        cell = Cell.new('B4')

        expect(cell).to be_an_instance_of(Cell)
    end

    it 'checks for ships' do
        cell = Cell.new('B4')

        cell.ship

        expect(cell.ship).to eq(nil)
    end

    it 'check for empty cells' do
        cell = Cell.new('B4')

        cell.ship

        expect(cell.empty?).to be true
    end

    it 'Adds a ship to the cell' do
        cell = Cell.new('B4')
        cruiser = Ship.new("Cruiser", 3)

        cell.place_ship(cruiser)

        expect(cell.place_ship(cruiser)).to eq(cruiser)
        expect(cell.empty?).to be false
    end

    it 'fires upon a ship' do
        cell = Cell.new('B4')
        cruiser = Ship.new("Cruiser", 3)

        cell.place_ship(cruiser)
        cell.fired_upon?

        expect(cell.fired_upon?).to be false

        cell.fire_upon
        expect(cell.fired_upon?).to be true

        expect(cell.ship.health).to eq(2)
    end






end
