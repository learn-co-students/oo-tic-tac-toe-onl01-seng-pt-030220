class TicTacToe
    def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8) 
    end

    def turn_count
        @board.count {|space| space != " "}
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Enter in a number between (1-9)"
        user_input = gets.chomp
        index = input_to_index(user_input)
        if valid_move?(index)
            token = current_player
            move(index, token)
        else
            turn
        end
        display_board
    end

    #WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],
    #[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    def won?
       WIN_COMBINATIONS.each do |win_combo|
        index1 = win_combo[0]
        index2 = win_combo[1]
        index3 = win_combo[2]

        pos1 = @board[index1]
        pos2 = @board[index2]
        pos3 = @board[index3]

        if pos1 == "X" && pos2 == "X" && pos3 == "X"
            return win_combo
        elsif pos1 == "O" && pos2 == "O" && pos3 == "O"
            return win_combo
        end
       end
       false
    end

    def full?
        @board.all? {|space| space != " "}
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
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
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end