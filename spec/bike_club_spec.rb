require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe Ride do
    let(:ride1) {Ride.new({ name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills })}
    let(:ride2) {Ride.new({ name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel })}
    let(:biker) {Biker.new("Kenny" , 30)}
    let(:biker1) {Biker.new("Athena" , 15)}
    let(:bikeclub) {BikeClub.new("bikeclub")}

    it 'exists' do
        expect(bikeclub).to be_instance_of(BikeClub)
    end

    it 'has attributes' do 
        expect(bikeclub.name).to eq("bikeclub")
        expect(bikeclub.bikers).to eq([])
    end

    it 'can add bikers' do
        bikeclub.add_bikers(biker)
        bikeclub.add_bikers(biker1)
        expect(bikeclub.bikers).to eq([biker,biker1])
    end

    it 'can show eligible riders' do
        bikeclub.add_bikers(biker)
        bikeclub.add_bikers(biker1)
        biker.learn_terrain!(:gravel)
        expect(bikeclub.eligible_bikers(ride1)).to eq([])
        expect(bikeclub.eligible_bikers(ride2)).to eq([biker])
    end

    it 'can show most rides biker' do
        bikeclub.add_bikers(biker)
        bikeclub.add_bikers(biker1)
        biker1.learn_terrain!(:hills)
        biker.learn_terrain!(:gravel)
        biker.log_ride(ride2, 60.9)
        biker.log_ride(ride2, 61.6)
        biker1.log_ride(ride1, 91.1)
        expect(bikeclub.most_rides_biker).to eq(biker)
    end

    it 'can show best record time' do
        bikeclub.add_bikers(biker)
        bikeclub.add_bikers(biker1)
        biker1.learn_terrain!(:hills)
        biker.learn_terrain!(:hills)
        biker.log_ride(ride2, 60.9)
        biker1.log_ride(ride2, 61.6)
        expect(bikeclub.best_record_biker(ride2)).to eq(biker)
    end
        
end