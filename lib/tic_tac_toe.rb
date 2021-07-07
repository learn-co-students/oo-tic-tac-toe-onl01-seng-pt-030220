class TicTacToe

 #attr_accessor :board
 

 
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end 
  
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
  
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
   input.to_i  - 1
  end 
    
  def move(index, token = "X")
    @board[index] = token 
  end 
  
  def position_taken?(index)
    @board[index] != " "
  end 
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end 
  
 def turn_count2 
   occupied_spaces  = 0 
   counter = 0 
   while counter < @board.size 
    if position_taken?(counter)
      occupied_spaces += 1 
    end 
   counter += 1 
  end 
   return occupied_spaces 
  end 
  
  
  def turn_count
    @board.select{ |p| p == "X" || p == "O"}.length
  end
  
  

  def current_player 
    if turn_count.even?
      return "X"
    else
      return "O"
    end 
  end 

 def turn
    puts "Where would you like to go?"
    input = gets.strip
    index = input_to_index(input)
    while !valid_move?(index)
        puts "This is invalid, try again."
        puts "Where would you like to go?"
        input = gets.strip
        index = input_to_index(input)
    end
      move(index,current_player)
      display_board
  end 
 
   def won?
    winning_combo = nil 
    WIN_COMBINATIONS.each do |combo|
     position_1 = combo[0]
     position_2 = combo[1]
     position_3 = combo[2]
     
     if @board[position_1] == "X" && @board[position_2] == "X" && @board[position_3] =="X" 
    winning_combo = combo 
   
     elsif @board[position_1] == "O" && @board[position_2] == "O" && @board[position_3] =="O" 
    winning_combo = combo
      end 
    end 
     winning_combo
    end 

   def full?
    @board.all? do |token| token == "X" || token == "O"
   end
  end 
  
   def draw? 
     !won? && full?
   end 
   
   def over? 
     won? || draw?
    end 
    
    def winner 
      if winning_combo = won?
        @board[winning_combo.first]
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

  
  

  


