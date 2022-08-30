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

end
