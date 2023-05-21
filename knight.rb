class Node

    attr_reader :coordinates

    def initialize(x = nil, y = nil)
        @coordinates = [x, y]
    end

end

class ChessBoard
    def display_board
        puts "    1   2   3   4   5   6   7   8  "
        puts "  #{row_separator}"
        puts " H#{space_separator}"
        puts "  #{row_separator}"
        puts " G#{space_separator}"
        puts "  #{row_separator}"
        puts " F#{space_separator}"
        puts "  #{row_separator}"
        puts " E#{space_separator}"
        puts "  #{row_separator}"
        puts " D#{space_separator}"
        puts "  #{row_separator}"
        puts " C#{space_separator}"
        puts "  #{row_separator}"
        puts " B#{space_separator}"
        puts "  #{row_separator}"
        puts " A#{space_separator}"
        puts "  #{row_separator}"
        puts ""
    end

    private

    def space_separator
        "|   " * 8 + "|"
    end
    
    def row_separator
        "+---" * 8 + "+"
    end
end

class KnightMoves

    VALID_MOVES = [
        [1, 2],
        [1, -2],
        [-1, 2],
        [-1, -2],
        [2, 1],
        [2, -1],
        [-2, 1],
        [-2, -1]
    ]

    attr_reader :board_array

    def initialize(start, destination)
        @start = start
        @destination = destination
        @board_array = []
        spaces = *(1..8)
        spaces.each do |x|
            spaces.each do |y|
                @board_array.push(Node.new(x, y))
            end
        end
    end

    def space_to_index(x, y)
        index = x * 8 + y
    end

    def is_legal?(current, target)
        x_diff = (current.coordinates[0] - target.coordinates[0]).abs
        y_diff = (current.coordinates[1] - target.coordinates[1]).abs
        return (x_diff == 1 && y_diff == 2) || (x_diff == 2 && y_diff == 1)
    end      

end

board = ChessBoard.new
board.display_board

puts "Hello! Let's get to cheating at chess. Please type your starting coordinates, as well as the space you'd like to get to."