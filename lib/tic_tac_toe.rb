class TicTacToe
  
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
  def initialize(board=nil)
    @board = board || board = Array.new(9," ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input_index = input.to_i - 1
    input_index
  end
  
  def move(index, token)
    if token == 'X'
      @board[0] = 'X'
    elsif token == 'O'
      @board[4] = 'O'
    end
  end
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(position)
    @board[position] == " " &&  position < 9 && position % 1 == 0 && position > -1
  end
  
  def turn
    puts "Please enter a position between 1-9"
    position = gets.chomp
    input = input_to_index(position)
    if valid_move?(input) == true
      @board[input] = current_player
      display_board
    else 
      turn
    end
  end
  
  def current_player
     turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def won?
    
    WIN_COMBINATIONS.detect do |winner|
      @board[winner[0]] == @board[winner[1]] &&
      @board[winner[1]] == @board[winner[2]] &&
      (@board[winner[0]] == "O" || @board[winner[0]] == "X")
    end
  end
  
  def full?
   space = @board.any? { |index| index == " "}
   !space
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won? == nil
      nil
    else 
      @board[won?[0]]
    end
  end
  
  def play
    turn until over?
    if draw? == true
      puts "Cat's Game!"
    elsif won? != nil
      puts "Congratulations " + winner + "!"
    end
      
  end
  
end