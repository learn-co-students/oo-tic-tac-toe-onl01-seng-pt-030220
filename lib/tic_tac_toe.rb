require 'pry'

class TicTacToe
    WIN_COMBINATIONS = [
        [0,4,8], [0,1,2], [3,4,5], [6,7,8], #Horizontal wins
        [0,3,6], [1,4,7], [2,5,8], #verticle wins
        [2,4,6] #diagonal wins
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

    def input_to_index(user_input)
        index = user_input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
       @board[index] == " " ? false : true
    end

    def valid_move?(position)
        valid = nil
        if position < 9 && position >= 0 && !position_taken?(position)
            valid = true
        else
            valid = false
        end
        valid
    end

    def turn_count
        result = @board.select{ |i| i != " "}
        result.count
    end

    def current_player
        player = nil
        if turn_count % 2 == 0 
            player = "X"
        else
            player = "O"
        end
        player
    end

    def turn
        move_made = false
        loop do 
            puts "Please enter where you would like to play (1-9)"
            user_input = gets.strip
            index = input_to_index(user_input)
            if valid_move?(index)
                move(index, current_player)
                display_board
                move_made = true
            end
            break if move_made == true
        end 

    end

    def won?
        all_x = [] 
        all_o = []
        @board.each_with_index do |player, index|
            if player == "X"
                all_x << index
            elsif player == "O"
                all_o << index
            end

        end
        
        x_win_combo = []
        o_win_combo = []
        WIN_COMBINATIONS.each do |win_array|
            all_x.each do |location|
                if location == win_array[0]
                    x_win_combo << location
                elsif location == win_array[1]
                    x_win_combo << location
                elsif location == win_array[2]
                    x_win_combo << location
                end

            end

            if x_win_combo.length == 3
                break
            else
                x_win_combo.clear
            end
        
            all_o.each do |location|
                if location == win_array[0]
                    o_win_combo << location
                elsif  location == win_array[1]
                    o_win_combo << location
                elsif location == win_array[2]
                    o_win_combo << location
                end

            end

            if o_win_combo.length == 3
                break
            else
                o_win_combo.clear
            end

        end

        if x_win_combo.length == 3
            x_win_combo
        elsif o_win_combo.length == 3
            o_win_combo
        else
            false
        end

    end

    def full?
        @board.include?(" ") ? false : true
    end
    
    def draw?
        if won?
            false
        elsif full? && !won?
            true
        elsif !full? && !won?
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
        if won?
            if current_player == "X"
                "O"
            else
                "X"
            end
        end
    end

    def play
        while over? == false
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end
