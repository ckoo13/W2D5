class Item
    def self.valid_date?(date_string)
        if date_string.length != 10
            return false
        end
        
        date_arr = date_string.split("-")

        if date_arr[0].length != 4
            return false
        end

        year = date_arr[1].to_i

        if year > 12 || year < 1
            return false
        end

        month = date_arr[2].to_i

        if month > 31 || month < 1
            return false
        end

        true
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description

        if !Item.valid_date?(deadline)
            raise "invalid date"
        end
    end

    def title
        @title
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "not a valid date"
        end
    end 

    def description
        @description
    end

    def description=(new_description)
        @description = new_description
    end
end