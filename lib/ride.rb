class Ride
    attr_reader :name, :distance, :terrain

    def initialize(ride_attributes)
        @name = ride_attributes[:name]
        @distance = ride_attributes[:distance]
        @loop = ride_attributes[:loop]
        @terrain = ride_attributes[:terrain]
    end

    def total_distance
        if @loop == false
            @distance * 2
        else
            @distance
        end
    end

    def loop?
        @loop
    end
end