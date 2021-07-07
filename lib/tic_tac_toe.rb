class TicTacToe

    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
        ]

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def turn_count #counts occupied positions
      @board.count{|token| token == "X" || token == "O"}
    end

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input) #accepts the user's input (a string) as an argument
      the_input = user_input.to_i #converts the user's input (a string) into an integer
      the_input - 1 #converts the user's input from the user-friendly format (on a 1-9 scale) to the array-friendly format (where the first
                    #index starts at 0)
    end

    def move(index, token)
      @board[index] = token
    end

    def position_taken?(index)
    @board[index] != " "
    end

    def valid_move?(index)
      #index between 0-8
      #position taken? what does it equal -- see the opposite of what it equals
      !position_taken?(index) && index.between?(0, 8)

    end

    def turn
      puts "Pick an empty slot"
      text = gets.chomp
      index = input_to_index(text)
      if valid_move?(index)
        move(index,current_player)
        display_board
      else
        turn
      end
    end

    def won?
      WIN_COMBINATIONS.find do |i|
        @board[i[0]] == @board[i[1]] &&
        @board[i[1]] == @board[i[2]] &&
        position_taken?(i[0])
      end
    end

    def full?
      @board.all? {|i| i =="X" || i =="O"}
    end

    def draw?
      !won? && full?
    end

    def over?
      won? || draw?
    end

    def winner
      if win = won?
        @board[win.first]
      end
    end

    def play
      while !over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

  end # END OF CLASS

  # puts "Welcome to Tic Tac Toe!"
  # game = TicTacToe.new
  # game.play
