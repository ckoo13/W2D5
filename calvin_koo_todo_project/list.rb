require_relative "item"

class List
    def initialize(label)
        @label = label
        @items = []
    end

    def label
        @label
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description="")
        item = Item.new(title, deadline, description)

        if !Item.valid_date?(deadline)
            raise "error: invalid deadline"
            false
        else
            @items << item
            true
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if index < 0 || index > self.size
            return false
        else
            return true
        end
    end

    def swap(index_1, index_2)
        if !valid_index?(index_1) || !valid_index?(index_2)
            return false
        else
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        end
    end 

    def [](index)
        if !valid_index?(index)
            return false
        else
            return @items[index]
        end
    end

    def priority
        @items.first
    end

    def print
        puts @label.center(10)
        puts "Index |  Item  | Deadline"
        @items.each_with_index do |ele, i|
            puts "#{i} | #{ele.title} | #{ele.deadline}"
        end
    end

    def print_full_item(index)
        item = @items[index]
        if valid_index?(index)
            puts "#{item.title}             #{item.deadline}"
            puts"#{item.description}"
        else
            return false
        end
    end 

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        if !valid_index?(index)
            return false
        end

        i = amount
        target_item = @items[index]
        new_index = index

        while i > 0
            if target_item != @items[0]
                @items[new_index], @items[new_index - 1] = @items[new_index - 1], @items[new_index]
                target_item = @items[index - 1]
                new_index = index - 1
            else
                return true
            end

            i -= 1
        end

        true
    end

    def down(index, amount=1)
        if !valid_index?(index)
            return false
        end

        i = amount
        target_item = @items[index]
        new_index = index


        while i > 0
            if target_item != @items[-1]
                @items[new_index], @items[new_index + 1] = @items[new_index + 1], @items[new_index]
                target_item = @items[index + 1]
                new_index = index + 1
            else
                return true
            end

            i -= 1
        end

        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline}
    end
end