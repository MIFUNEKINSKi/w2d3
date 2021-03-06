require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    
    def initialize(n)
        @player = Player.new
        Board.new(n)
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end 


    def start_game
       @board.place_random_ships
       puts "There are #{@board.num_ships} on the board"
       @board.print
    end 

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            true
        else
            false
        end 
    end 

    def win?
        if @board.num_ships == 0 
            puts "you win"
            true
        else
            false
        end 
    end 

    def game_over?
        win? || lose?
    end

     def turn
        # here it's @player because it's referencing this instance of player,
        # and we have an instance variable referencing it

        # same for @board
        pos = @player.get_move 
        @remaining_misses -= 1 if !@board.attack(pos)
        @board.print
        puts "#{@remaining_misses} remaining missing"
       

    end 

   

end
