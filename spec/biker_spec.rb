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
end