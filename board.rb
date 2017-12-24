require_relative 'utils/spinner'
class Board 

    def initialize(game_difficulty)
        @difficulty_input = game_difficulty

        determine_difficulty(@difficulty_input)
    end

    # Determine the user's desired game difficulty
    def determine_difficulty(difficulty_input)
        @difficulty_input = difficulty_input.upcase.chomp
        puts @difficulty_input
        if @difficulty_input == "EASY" || @difficulty_input == "MEDIUM" || @difficulty_input == "HARD"
            printf("You have selected %s\n", @difficulty_input)
            generate_game_board(@difficulty_input)
        else
            # If the user doesnt input a valid difficulty, the generate_minefield function will be recursively called after informing the user of 
            # their mistake.
            puts "Please input a valid difficulty option. You can chose one of the following: Easy, Medium or Hard"
            @difficulty_input = gets.chomp
            determine_difficulty(@difficulty_input)
        end
    end

    def generate_game_board(difficulty)
        # Based on the difficulty choice, define the board size. The board is always going be an even sized grid, so a single integer to define board
        # size will be fine. Just use it for both dimensions of the board array.
        case difficulty
            when "EASY"
                @board_size = 10
            when "MEDIUM"
                @board_size = 25
            when "HARD"
                @board_size = 50
        end

        game_board_reference = Array.new(@board_size) { Array.new(@board_size) { Random.rand(2) == 1 ? 0 : 1}}

        print_game_state(game_board_reference, @board_size, nil, nil)

    end

    def print_game_state(game_board, board_size, x_choice, y_choice)

        game_board.each_with_index do |col, col_index|
            
            # The following loop will output the X axis labels
            if col_index == 0
                0.upto(col.length - 1) do |i|
                    if i == 0
                        printf("    %s", i)
                    elsif i == (board_size - 1)
                        printf("%s \n    ---------- \n", i)
                        
                    else
                        printf("%s", i)
                    end
                end
            end

            printf("%s | ", col_index) # Y axis labels
            col.each_with_index do |row, row_index|
                if row == 0 || row == 1
                    if row[board_size]
                        printf(" ", row)
                    else
                        printf("  ", row)
                    end
                else
                    if row[board_size]
                        printf("%s", row)
                    else
                        printf("%s ", row)
                    end
                end

            end
            print(" |\n")
        end
    end
end