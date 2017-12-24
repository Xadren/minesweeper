require_relative 'board' # Load the board class

puts "What game difficulty would you like? Easy, Medium or Hard";
difficulty_input = gets.chomp

game_board = Board.new(difficulty_input)

