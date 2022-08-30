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


    it 'renders the coordinate' do
        cell_1 = Cell.new("B4")

        expect(cell_1.render).to eq("•")

        cell_1.fire_upon

        expect(cell_1.render).to eq("M")

        cell_2 = Cell.new("C3")
        cruiser = Ship.new("Cruiser", 3)

        cell_2.place_ship(cruiser)
        cell_2.render

        expect(cell_2.render).to eq("•")

        cell_2.render(true)

        expect(cell_2.render).to eq("S")

        cell_2.fire_upon

        expect(cell_2.render).to eq("H")
        expect(cruiser.sunk?).to be false

        cruiser.hit
        cruiser.hit
        cell_2.render

        expect(cruiser.sunk?).to be true
        expect(cell_2.render).to eq("X")
    end

end
