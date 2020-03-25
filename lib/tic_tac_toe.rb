require "pry"
class TicTacToe
    attr_accessor :board

WIN_COMBINATIONS =[
    [0,1,2], 
    [3,4,5],
    [6,7,8],
    [0,3,6], 
    [1,4,7], 
    [2,5,8],
    [0,4,8],
    [2,4,6]
] 

    def initialize(board = nil)
    @board = board 
    @board = Array.new(9," ")
    end

    def display_board
        @board
        y = "-----------"
        puts " #{board[0]} | #{board[1]} | #{board[2]} " 
        puts y 
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts y 
        puts " #{board[6]} | #{board[7]} | #{board[8]} " 
    
    end 

    def input_to_index(input)
        input = input.to_i 
        input -1 
    end

    def move(input,position)
    board[input] = position
    end
 
    def position_taken?(input)
        if board[input] == (" ") || board[input] == ("") || board[input]== nil 
            false
        else
            true 
        end
    end


    def valid_move?(input)
        if input.between?(0,8) && !position_taken?(input) 
            true
        else 
            false 
        end
    end

    def turn_count 
        counter = 0 
        board.each do |a| 
            if a == "X" || a == "O"
                counter += 1
            end
        end
        counter
    end

    def current_player
        if turn_count % 2 == 0 
            "X"
        else
            "O"
        end
    end

    def turn 
        userinput = gets.strip 
        board_index = input_to_index(userinput)
        if valid_move?(board_index)
            move(board_index,current_player)
            display_board
        else
            userinput = gets.strip
        end
    end

    def won?
        winning_combo = nil
        WIN_COMBINATIONS.each do |combo| 
            one = combo[0]
            two = combo [1]
            three = combo [2] 

            if board[one] == "X" && board[two] == "X"&& board[three] == "X" 
                winning_combo = combo
            elsif
                board[one] == "O" && board[two] == "O" && board[three] == "O"
                winning_combo = combo
            end
        end
        winning_combo
    end

    def full? 
    turn_count >=9 
    end

    def draw? 
        if full? && !won? 
        true
        end
    end

    def over? 
        if won? 
            true 
        elsif
            draw?
            true 
        end
    end 

    def winner
        if won? 
            if turn_count.odd?
                "X"
            else
                "O"
            end
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
