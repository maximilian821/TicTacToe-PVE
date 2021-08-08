require_relative 'board'
require_relative 'check_win'

class TicTacToe
  @b = Board.new
  
  def self.start
    while (count_moves = (@b.layout.count { |e| e == 'X ' || e == 'O ' })) != 9 do
      @b.print_board
      puts "\nYour move:"
      loop do
        move = gets.strip.downcase
        if is_valid?(move)
          index = @b.layout.index(move)
          @b.layout[index] = 'X '
          break
        else
          puts 'Incorrect move. Try again'
        end
      end
      @b.layout[computer_move] = 'O ' if count_moves < 8
      break if Win.check(@b.layout)
    end
    @b.print_board
    if Win.check(@b.layout)
      Win.check(@b.layout) == 'X ' ? (puts "\nYou won!") : (puts "\nComputer won!")
    else
      puts "\nDraw!"
    end
  end

  private

  def self.is_valid?(value)
    (@b.layout.include?(value) && value != 'X ' && value != 'O ') ? true : false
  end

  def self.computer_move
    empty = @b.layout.select { |e| e != 'X ' && e != 'O ' }
    empty_indexes = []
    empty.each { |e| empty_indexes << @b.layout.index(e) }

    return 4 if @b.layout[4] != 'X ' && @b.layout[4] != 'O '

    move = calculate_move('O ')
    return move if move

    move = calculate_move('X ')
    return move if move

    if @b.layout[0] == 'X ' && @b.layout[8] == 'X ' || @b.layout[2] == 'X ' && @b.layout[6] == 'X '
      return ([1, 3, 5, 7] & empty_indexes).sample
    end
    a = ([0, 2, 6, 8] & empty_indexes).sample
    return a == nil ? empty_indexes.sample : a
  end

  def self.calculate_move(item)
    @b.empty_spots.each do |s|
      board = @b.layout.dup
      board[s] = item
      return s if Win.check(board)
    end
    false
  end
end
