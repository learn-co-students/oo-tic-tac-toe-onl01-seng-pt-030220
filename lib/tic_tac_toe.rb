class TicTacToe 
  
  WIN_COMBINATIONS = [
                    [0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8],
                    [0, 3, 6],
                    [2, 5, 8],
                    [4, 1, 7],
                    [0, 4, 8],
                    [2, 4, 6]
                    ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i- 1
  end 
  
  def move(index, player = "X")
    @board[index] = player
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn 
    puts "Choose a number 1-9."
    input = gets.chomp 
    index = input_to_index(input)
    if valid_move?(index) 
      player = current_player
      move(index, player)
      display_board
    else
      input = gets.chomp
    end
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
  
  def won?
    WIN_COMBINATIONS.each {|combo|
      index0 = combo[0]
      index1 = combo[1]
      index2 = combo[2]
      
      pos1 = @board[index0]
      pos2 = @board[index1]
      pos3 = @board[index2]
      
      if pos1 == "X" && pos2 == "X" && pos3 == "X"
        return combo 
      elsif pos1 == "O" && pos2 == "O" && pos3 == "O"
        return combo
      end 
    }
    false
  end
  
  def full?
   @board.all? {|index| index == "O" || index == "X"}
  end
  
  def draw?
    if !won? && full?
      true 
    elsif won?
      false
    else
      false
    end
  end
  
  def over? 
    if won? || draw?
      true
    else
      false
    end
  end
  
  def winner 
    index = []
    index = won? 
    if index == false
      return nil
    else 
      if @board[index[0]] == "X"
        return "X"
      else 
        return "O"
      end
    end
  end
  
  def play 
    until over? == true 
      turn 
    end 
    
    if won? 
      puts "Congratulations #{winner}!"
    elsif draw? 
      puts "Cat's Game!"
    end
  end
  
end 