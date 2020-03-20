require 'pry'

class TicTacToe

  WIN_COMBINATIONS = [
   [0,1,2], # Top row
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6] # Middle row
            # et cetera, creating a nested array for each win combination
 ]

 def initialize
  @board = [" "," "," "," "," "," "," "," "," "]
 end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
   user_input.to_i-1
end

def move(user_input,token="X")
  @board[user_input]=token
end

def position_taken?(user_input)
  #if @board[user_input] == "X" || @board[user_input] == "O"
  #  return true
  #else
  #  return false
  #end
  !(@board[user_input].nil? || @board[user_input] == " ")

end

def valid_move?(position)
   position.between?(0, 8) && !position_taken?(position)
end

def turn
    puts " please enter a number 1-9:"
    input = gets.strip
    index=input_to_index(input)
    name=current_player
   if valid_move?(index)
       move(index,name)
       display_board
   else
     puts "That was invalid ,input again."
     turn
   end
end

def current_player
   if turn_count % 2 == 0
     "X"
   else
     "O"
   end
end

def turn_count
  @board.count { |token| token == 'X' || token == 'O' }
end


def won?
  WIN_COMBINATIONS.each  do  |win_combination|

    if win_combination.all? {|a| @board[a] == "X"} || win_combination.all? {|a| @board[a] == "O"}
       return  win_combination
    end

   end
   return false

end
 def full?
   @board.all? {|z| z == "X" || z == "O"}
 end
def draw?
   full? && !(won?)
end
def over?
   won? || draw?
end

 def winner
   if  won?
     return  @board[won?[0]]
   else
     return nil
   end
 end

 def play

   turn until over?
    won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")

    #if won?
    #   puts "Congratulations #{winner}!"
    #elsif draw?
    #   puts "Cat's Game!"
    #end

 end


end
