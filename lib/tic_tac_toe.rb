class TicTacToe
 
 WIN_COMBINATIONS = [
   [ 0, 1 ,2 ],
   [ 3, 4, 5 ], 
   [ 6, 7, 8 ],
   [ 0, 4, 8 ],
   [ 2, 4, 6 ], 
   [ 0, 3, 6 ],
   [ 1, 4, 7 ],
   [ 2, 5, 8 ]
   ] 
 
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
  
  def input_to_index(input)
    user_move = input.to_i - 1
  end 
  
  def move(board_index, token = "X")
    @board[board_index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else 
      true
    end
  end 
  
  def valid_move?(index)
    if self.position_taken?(index) || !index.between?(0,8)
      false
    else 
      true
    end 
  end
  
  def turn_count
    @board.count do |index|
      index != " " && index != nil
    end 
  end 

  def current_player
    if turn_count.even? 
      return "X"
    else
      return "O"
    end
  end 
  
  def turn
    puts "Make a move"
    user_input = gets.strip
    index = input_to_index(user_input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end 
  
  def won?
    x_arr = []
    o_arr = []
    
    @board.each_with_index do |character, index|
      if character == "X"
        x_arr << index
      elsif character == "O"
        o_arr << index
      end
    end
    
    WIN_COMBINATIONS.each do |combination|
      
      if (x_arr & combination).length == 3
        return x_arr & combination
      elsif (o_arr & combination).length == 3
        return o_arr & combination
      end
    end
    return false
  end
  
  def full?
    if @board.include?(" ")
      return false
    elsif !@board.include?(" ")
      return true
    end 
  end 
    
  def draw? 
    if !@board.include?(" ") && won? == false
      return true 
    else
      return false
    end
  end
  
  def over?
    if full? || draw?
      return true
    end
  end
  
  def winner
    if won?
      return current_player == "O" ? "X" : "O"
    end
  end
  
  def play 
    until won? || over? do
      turn 
    end 
    
    if draw?
      puts "Cat's Game!"
    end
    
    if winner == "X"
      puts "Congratulations X!"
    else 
      puts "Congratulations O!"
    end
  end

end


