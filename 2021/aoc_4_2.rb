# variables

boards_file = File.read("data/input_day4_part2.txt")
input_file = File.read("data/input_day4_part1.txt")
board_array = []
input_array = []
board_count = 0
@winning_board = []
@winning_numbers = []
@last_number = 0

# build boards and inputs into an array from data
boards_file.each_line do |line|
    if line == "\n"
        board_count += 1
    else  
        if board_array[board_count] == nil
            board_array[board_count] = []
            board_array[board_count] << line.split
        else  
            board_array[board_count] << line.split
        end
    end
end

def check_rows(board_array, input)
    board_array.each do |board|
        board.each do |row|
            if row & input == row
                @winning_board = board
                @last_number = input[-1].to_i
            end
        end
    end
end

def check_cols(board_array, input)
    board_array.each do |board|
        columns = board.transpose
        columns.each do |col|
            if col & input == col
                @winning_board = board
                @last_number = input[-1].to_i
            end
        end
    end
end

def calulate_score(input)
    #print @winning_board
    sum_of_matrix = 0
    @winning_board.each do |row|
        row.each do |val|
            sum_of_matrix += val.to_i unless input.include?(val)
        end
    end
    print sum_of_matrix
end

input_file.split(",") do |number|
    input_array << number
    check_cols(board_array, input_array)
    check_rows(board_array, input_array)
end

calulate_score(input_array)

print @last_number