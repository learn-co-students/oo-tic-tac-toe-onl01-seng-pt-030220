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
  #@display_board =display_board
end
#binding.pry


end
