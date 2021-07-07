require "pry"

class TicTacToe

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(num)
    num.to_i - 1
    # @board[num] << current_player
  end

  def move(index, token = "X")
    # index = num.input_to_index
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O" # = !(@board[index] == " " || @board[index] == "")
      true
    else
      false
    end
  end

  def valid_move?(index)
    if position_taken?(index) || index > 8 || index < 0 # 1.that is not taken, 2.index has to be between 0-8
      false
    else
      true
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"} # count element(token) numbers which are X or O
  end
    # how many tokens which are equal to X or O in @board array (array.count {|elm| elm%2 == 0})

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
    # the code before the ? ("question mark") is evaluated as a boolean expression.
    # If it returns true, the code on the left side of the : ("colon") will run,
    # otherwise the code on the right will run.

  def turn
    puts "Please input number between 1 and 9."
    int = gets.strip
    index = input_to_index(int)
    if valid_move?(index) # == true is not necessary
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |winner|
      @board[winner[0]] == @board[winner[1]] &&  # winner [1,2,3] @board[winner[0]] == @board[1]
      @board[winner[1]] == @board[winner[2]] &&
      (@board[winner[0]] == "O" || @board[winner[0]] == "X") # everything is taken here
      #[1,4,7]
      #["x", "x", "x"]
    end
  end

  def full?
   if !@board.include?(" ") # @board.all? do |token| if token == "X" || token == "O"
     true
   else
     false
   end
  end

  def draw?
    if !won? && full?
      true
    elsif won? || !full?
      false
    end
  end

  def over?
    won? || draw?
  end

  def winner
    if win_combo = won?
      @winner = @board[win_combo.first]#the piece that has won
    end
  end

  def play
    until over?
      turn
    end

    if winner
      puts "Congratulations #{@winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    end

  end

end
