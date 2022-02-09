class Board
    attr_reader :size
    def initialize 
        @grid = Array.new(3) {Array.new(3, "_")}
        @size = (3 * 3)

    end 

    def valid?(position)
        row, col = position
        if (row > 2 || row < 0) || (col > 2 || col <0) 
            return false
        else 
            return true
        end
    end 

    def empty?(position)
        row, col = position
        @grid[row][col] == "_"
    end

    def place_mark(position, mark)
        row, col = position
        if empty?(position) && valid?(position)
            @grid[row][col] = mark
        else 
            raise "you cannot place a mark here"
        end 

    end

    def print 
        @grid.each do |row|
        puts row.join(" ")
        end
    end

    def win_row?(mark)
        return true if @grid.any? { |row| row.uniq.include?(mark)  }
        return false
    end 

    def win_col?(mark)
        return true if @grid.transpose.any? { |col| col.uniq.include?(mark)  }
        return false
    end 

    def win_diagonol?(mark)
        main_diagonal, anti_diagonal = [], []
        (0...@grid.length).each do |i|
            main_diagonal << @grid[i][i]
            anti_diagonal << @grid[i][-i - 1]
        end

        return true if (main_diagonal.uniq.include?(mark) || anti_diagonal.uniq.include?(mark))
        return false
    end 

    def empty_positions?
        @grid.flatten.include?("_")
    end 

 def win?
    win_row?(@mark) || win_col?(@mark) || win_diagonol?(@mark)
  end
    
end 

