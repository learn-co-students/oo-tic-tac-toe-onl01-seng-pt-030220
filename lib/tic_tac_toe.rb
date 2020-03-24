class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input) #Need to take an input from user, then use ".to_i" to turn to integer and subtract 1 to match indices
    user_input.to_i - 1
  end

  def move(index, token = "X") #initiates play by first taking index(argument 1), and making that equal to the token(X or O) to fill the space
    @board[index] = token
  end

  def position_taken?(index) #takes in the user input i.e the index(define this later) and makes sure this position isnt taken
    @board[index] != " "     #by using the bang operator equal to an empty space
  end

  def valid_move?(index) # to ensure its a valid move, bang operator to ensure position taken method is false AND use ".between" to
    !position_taken?(index) && index.between?(0,8) #confirm valid index range
  end

  def turn_count                           #iterates over the board array and counts all the instances not = to empty array
    @board.count{|square| square != " " }
  end

  def current_player              #determining whos turn it is by seeing if the turn count method is even. X if it is, O if not
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter a number (1-9):" #Ask for input
    user_input = gets.strip             #receive input
    index = input_to_index(user_input)  #translate, which then sets the index variable as an argument for methods
    if valid_move?(index)               #if valid, determine token by current player method
      token = current_player
      move(index, token)                #make the move
    else
      turn                               #if not valid, then go back to turn to try again
    end
    display_board                        #display
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo                  #iterate through win combos and matchup the winning combo to the board
      end                             #by first seeing if the first index of the winning combo is taken, then matching up the board
  end                                 #with the respective indices of the winning combo and the same token

  def full?                              #if theres no winning combos and the board is full? check to see
    @board.all?{|square| square!= " " }
  end

  def draw?                              # if its full AND there is no winner its a draw
    full? && !won?
  end

  def over?                           # if someone wins OR its a draw its over
    won? || draw?
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
