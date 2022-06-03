class Passenger
    def initialize(name)
        @name = name
        @flight_numbers = []
    end 

    def name
        @name
    end

    def has_flight?(flight_number)
        low_case = flight_number.downcase
        up_case = flight_number.upcase

        @flight_numbers.include?(up_case || low_case)
    end

    def add_flight(flight_number)
        low_case = flight_number.downcase
        up_case = flight_number.upcase

        if !self.has_flight?(flight_number)
            @flight_numbers << up_case
        end
    end
end