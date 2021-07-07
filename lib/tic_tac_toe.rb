class TicTacToe

    attr_accessor :board

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]
def initialize
    board = [" "," "," "," "," "," "," "," "," "]
    @board = board
end 

def display_board
    @board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end 

  def move(index, player)
    board[index] = player
  end 

  def position_taken?(index)
    board[index] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end 

  def turn_count
    board.count{|token| token == "X" || token == "O"}
  end 

  def current_player
    if turn_count.odd?
        "O"
    else
        "X"
    end
  end 

  def turn
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
        move(index, current_player)
        display_board
    else
        turn
    end 
  end

  
  #WIN_COMBINATIONS = [
   # [0,1,2], = 0
    #[3,4,5], = 1
    #[6,7,8], = 2
    #[0,3,6], = 3
   #[1,4,7], = 4
    #[2,5,8], = 5
    #[0,4,8], = 6
    #[6,4,2] = 7
  #]
  

  def won?
    WIN_COMBINATIONS.detect do |combination|
        board[combination[0]] == board[combination[1]] &&
        board[combination[1]] == board[combination[2]] &&
        position_taken?(combination[0])
      end
  end

   def full?
    board.all?{|token| token == "X" || token == "O"}
   end 

   def draw?
    !won? && full?
   end 

   def over?
    won? || draw?
   end 

   def winner
    if winning_combination = won?
        board[winning_combination.first]
    end
   end 

   def play 
        until over?
            turn 
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!" 
        end    
   end 

end
