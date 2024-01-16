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
end