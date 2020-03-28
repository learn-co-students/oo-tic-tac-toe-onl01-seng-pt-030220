require 'pry'
class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
    WIN_COMBINATIONS
  end 
  
  WIN_COMBINATIONS=[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " ----------- "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " ----------- "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
   
  def input_to_index(input)
    input.to_i - 1
  end
    
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please specify a position between 1-9: "
    input = gets.chomp
    #input = user_input.is_i 
    
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else 
      turn
    end
  end
    
  #   input = gets.strip
  #   index = input_to_index(input)
  #   token = current_player
  #   if valid_move?(index)
  #     move(index, token)
  #     display_board
  #   else
  #     turn 
  #   end
  # end
  
  def turn_count
    turn = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
    end
    turn
  # @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    # if turn_count.odd?
    #   "O"
    # else
    #   "X"
    # end
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    a = WIN_COMBINATIONS.find{|combo| @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"}
    b = WIN_COMBINATIONS.find{|combo| @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"}
    a || b
    # WIN_COMBINATIONS.each do |combo|
    #   index0 = combo[0]
    #   index1 = combo[1]
    #   index2 = combo[2]
      
    #   pos1 = @board[index0]
    #   pos2 = @board[index1]
    #   pos3 = @board[index2]
      
    #   if pos1 == "X" && pos2 == "X" && pos3 == "X"
    #     return combo 
    #   elsif pos1 == "O" && pos2 == "O" && pos3 == "O"
    #     return combo 
    #   end 
    # end
    # false
  end

  def full?
    @board.all?{|index| index == "X" || index == "O"}
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    
    won? || draw?
  end

  def winner
    # def winner(board)
    # if won?(board)
    #   winning_line = won?(board)
    #   return board[winning_line[0]]
    # end
     
    # if won? == "X"
    #   return "X"
    # elsif won? == "O"
    #   return "O"
    # else
    #   nil
    # end
      
    index = []
    index = won?
    if index == nil
      return nil
    elsif @board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
  
  
  def play 
    until over?
      turn
      #break
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end
  
end

# class TicTacToe
#   def initialize(board = nil)
#     @board = board || Array.new(9, " ")
#   end
 
#   def current_player
#     turn_count % 2 == 0 ? "X" : "O"
#   end
 
#   def turn_count
#     @board.count{|token| token == "X" || token == "O"}
#   end
 
#   def display_board
#     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#     puts "-----------"
#     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#     puts "-----------"
#     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#   end
# end