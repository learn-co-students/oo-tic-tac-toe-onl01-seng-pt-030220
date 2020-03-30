class TicTacToe
  
  attr_accessor :board
  
  def initialize
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]]

def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
      
      
def input_to_index(input)
  input.to_i - 1
  # binding.pry
end
  
  def move( index, token = "x")
    board[index] = token
    
end
  
  def position_taken?(index)
    board[index] != " "
    
end
def valid_move(board, index) 
  index.between?(0,8) && !position_taken?(board,index)
  
end

def turn(board)
  puts "Where would you like to go?"
  input = gets.strip
  index = input_to_index(input)
  
  if valid_move?(board, index)
    move(board, index, "X")
      display_board(board)
    else
      puts "That move was invalid, try again."
      turn(board)
    end
    
    def turn_count(board)
      
      occupied_spaces = 0
      counter = 0 
      while couter < board.size 
      position_taken?(board,index)
      occupied_spaces += 1
    end
        counter += 1 
    end
  occupied_spaces
  end
end