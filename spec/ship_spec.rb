require 'rspec'
require './lib/ship.rb'
require 'pry'

RSpec.describe Ship do
    it 'exists' do
        cruiser = Ship.new("Cruiser", 3)
        expect(cruiser).to be_an_instance_of(Ship)
    end

    it 'has readable attributes' do
        cruiser = Ship.new("Cruiser", 3)

        expect(cruiser.name).to eq("Cruiser")
        expect(cruiser.ship_length).to eq(3)
    end

    it 'has a health status' do
        cruiser = Ship.new("Cruiser", 3)

        expect(cruiser.health).to eq(3)
    end

    it 'can be sunk' do
        cruiser = Ship.new("Cruiser", 3)

        expect(cruiser.sunk?).to be false
    end

    it "can be atttacked" do
        cruiser = Ship.new('Cruiser', 3)

        expect(cruiser.ship_length).to eq(3)
        expect(cruiser.health).to eq(3)
        expect(cruiser.sunk?).to be false

        cruiser.hit

        expect(cruiser.health).to eq(2)
        expect(cruiser.sunk?).to be false

        cruiser.hit

        expect(cruiser.health).to eq(1)
        expect(cruiser.sunk?).to be false

        cruiser.hit

        expect(cruiser.health).to eq(0)
        expect(cruiser.sunk?).to be true
    end





end
