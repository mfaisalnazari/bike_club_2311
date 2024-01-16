class BikeClub
    attr_reader :name, :bikers
    def initialize(name)
        @name = name
        @bikers = []
    end

    def add_bikers(biker)
        @bikers << biker
    end

    def eligible_bikers(ride)
        @bikers.find_all {|biker| biker.acceptable_terrain.include?(ride.terrain) && biker.max_distance > ride.total_distance }
    end

    def most_rides_biker
        @bikers.find do
            |biker| biker.rides.keys.max
        end
    end

    def best_record_biker(ride)
        @bikers.min_by do
            |biker| biker.personal_record(ride)
        end
    end
end