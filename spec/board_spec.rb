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

  describe 'checks a coordinate' do
    it 'checks if a coordinate is valid and will return true' do
      board = Board.new

      board.valid_coordinate?("A1")
      board.valid_coordinate?("D4")

      expect(board.valid_coordinate?("A1")).to be true
      expect(board.valid_coordinate?("D4")).to be true

    end

    it 'check is the coordinate is invalid and will return false' do
      board = Board.new

      board.valid_coordinate?("A5")

      expect(board.valid_coordinate?("A5")).to be false
    end
  end

  describe 'valid_placement?' do
    it 'validates the coordinates are the same length as the ship and returns true' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      board.valid_length?(cruiser, ["A1", "A2", "A3"])

      expect(board.valid_length?(cruiser, ["A1", "A2", "A3"])).to be true
    end

    it 'returns false if the coordinates are != to ship length' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      board.valid_length?(submarine, ["A2", "A3", "A4"])

      expect(board.valid_length?(submarine, ["A2", "A3", "A4"])).to be false
    end


    it "checks that coordinates are consecutive horizontally" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      board.valid_horizontal?(["A1", "A2", "A4"])
      board.valid_horizontal?(["A3", "A2", "A1"])
      board.valid_horizontal?(["B1", "B2"])

      expect(board.valid_horizontal?(["B1", "B2"])).to be true
      expect(board.valid_horizontal?(["A3", "A2", "A1"])).to be false
      expect(board.valid_horizontal?(["A3", "A2", "A1"])).to be false

    end
  end



end
