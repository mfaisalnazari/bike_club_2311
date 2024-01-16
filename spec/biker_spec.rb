require './lib/ride'
require './lib/biker'

RSpec.describe Ride do
    let(:ride1) {Ride.new({ name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills })}
    let(:ride2) {Ride.new({ name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel })}
    let(:biker) {Biker.new("Kenny" , 30)}
    let(:biker1) {Biker.new("Athena" , 15)}

    it 'exists' do
        expect(biker1).to be_instance_of(Biker)
        expect(biker).to be_instance_of(Biker)
    end

    it 'has attributes' do 
        expect(biker.name).to eq("Kenny")
        expect(biker.max_distance).to eq(30)
        expect(biker.rides).to eq({})
        expect(biker.acceptable_terrain).to eq([])
        expect(biker1.name).to eq("Athena")
        expect(biker1.max_distance).to eq(15)
        expect(biker.rides).to eq({})
        expect(biker.acceptable_terrain).to eq([])
    end

    it 'can learn terrain' do
        biker.learn_terrain!(:gravel)
        expect(biker.acceptable_terrain).to eq([:gravel])
        biker.learn_terrain!(:hills)
        expect(biker.acceptable_terrain).to eq([:gravel, :hills])
    end

    it 'can log ride' do
        biker.learn_terrain!(:gravel)
        biker.learn_terrain!(:hills)
        biker.log_ride(ride1, 92.5)
        biker.log_ride(ride1, 91.1)
        biker.log_ride(ride2, 60.9)
        biker.log_ride(ride2, 61.6)
        expect(biker.rides.keys).to eq([ride1, ride2])
    end

    it 'can show personal record' do
        biker.learn_terrain!(:gravel)
        biker.learn_terrain!(:hills)
        biker.log_ride(ride1, 92.5)
        biker.log_ride(ride1, 91.1)
        biker.log_ride(ride2, 60.9)
        biker.log_ride(ride2, 61.6)
        expect(biker.rides.keys).to eq([ride1, ride2])
        expect(biker.personal_record(ride1)).to eq(91.1)
        expect(biker.personal_record(ride2)).to eq(60.9)
        expect(biker1.personal_record(ride1)).to eq(false)
    end
end