class TicTacToe 
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0, 1, 2], 
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [1, 4, 7],
    [2, 4, 6],
    [0, 3, 6],
    [2, 5, 8]
    ]
    
    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(num) 
    num.to_i - 1  
  end 
  
  def move(index, current_player = "X") 
    @board[index] = current_player
  end 
  
  def position_taken?(index)
    if @board[index] == nil || @board[index] == " "
      false 
    else 
      true  
    end 
  end 
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end 
  
  def turn_count 
    turn = 0 
    @board.each do |index|
      if index == "X" || index == "O"
        turn += 1 
      end 
    end 
    turn 
  end 
  
  def current_player
    if turn_count % 2 == 0 
      "X" 
    else 
      "O" 
    end 
  end 
  
    def turn
  puts "Please enter 1-9:"
  input = gets.chomp 
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end
  
  def won? 
    WIN_COMBINATIONS.detect {|i| i.all? {|p| @board[p] == "X"} || i.all? {|p| @board[p] == "O"}}
  end 
  
  def full? 
    turn_count == 9 
  end 
  
  def draw?
    full? && !won? 
  end 
  
  def over?
    won? || draw? 
  end 
  
  def winner 
   if winner = won?
      @board[winner[0]]
    end
  end 
  
  def play
    until over?
      turn
    end 
    if won?
      winner = winner()
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end 
    return nil 
  end 
end 

