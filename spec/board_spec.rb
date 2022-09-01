require 'rspec'
require './lib/ship.rb'
require './lib/cell.rb'
require './lib/board.rb'
require 'pry'

RSpec.describe Board do
    it 'exists' do
        board = Board.new

        expect(board).to be_an_instance_of(Board)
    end

    describe 'cells' do
        it 'returns a hash' do
            board = Board.new
            
            expect(board.cells.class).to be Hash 
        end

        it 'has 16 key/value pairs' do
            board = Board.new

            expect(board.cells.keys.count).to eq(16)
        end

        it 'has cell objects' do 
            board = Board.new

            expect(board.cells["A1"]).to be_an_instance_of(Cell)
        end
    end
end