require 'colorize'

class Board
  attr_accessor :layout
  def initialize
    @layout = ['a1', 'a2', 'a3', 'b1', 'b2', 'b3', 'c1', 'c2', 'c3']
  end

  def empty_spots
    spots = []
    @layout.each_with_index do |e, i|
      next if e == 'X ' || e == 'O '
      spots << i
    end
    return spots
  end

  def print_board
    system('clear')
    board = @layout.dup

    board.each_with_index do |e, i|
      board[i] = board[i].green if e == 'X '
      board[i] = board[i].red if e == 'O '
    end

    puts " #{board[0]}  |  #{board[1]} |  #{board[2]}"
    puts '------------------'
    puts " #{board[3]}  |  #{board[4]} |  #{board[5]}"
    puts '------------------'
    puts " #{board[6]}  |  #{board[7]} |  #{board[8]}"
  end
end
