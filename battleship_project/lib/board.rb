require "byebug"
class Board
    attr_reader :size
    def initialize (n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = (n*n)
    end 
    def [](arr)
        row, col = arr
         @grid[row][col]
    end
    def []=(arr, val)
         @grid[arr[0]][arr[1]] = val
    end 
    def num_ships
       @grid.flatten.count(:S)
    end 

    # part 2
    def attack(arr)
        row, col = arr
        
        if self.[](arr) == :S
            self.[]=(arr, :H)
            puts "you sunk my battleship"
            true
        else
            self.[]=(arr, :X)
            false
        end
    end 
def place_random_ships
    
    fourth = (@size / 4)
    while num_ships < fourth
    i = rand(0...@grid.length)
    j = rand(0...@grid.length)
      random_range = [i, j]
      self[random_range] = :S # must call on current instance 
    end
  end

  def hidden_ships_grid
    # new_grid = Array.new(@grid.length) {Array.new(@grid.length)}
    # (0...@grid.length).each do |i|
    #     (0...@grid.length).each do |j|
    #         if @grid[i][j] == :S
    #             new_grid[i][j] = :N
    #         else
    #              new_grid[i][j] = @grid[i][j]
    #         end 
    #     end 
    # end 
    # new_grid
    @grid.map do |row|
        row.map do |ele|
            if ele == :S
                :N
            else
                ele
            end 
        end 
    end 
  end

    
    def self.print_grid(arr)                 
        arr.each do |sub_arr|
            puts sub_arr.join(' ')
        end
    end

    def cheat
        Board.print_grid(@grid)
    end 

    def print
        Board.print_grid(hidden_ships_grid)
    end 

   



  
end
