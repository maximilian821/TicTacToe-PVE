class Win
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def self.check(board)
    x = ['X ', 'X ', 'X ']
    o = ['O ', 'O ', 'O ']
    WIN_COMBINATIONS.each do |c|
      combination = board.values_at(c[0], c[1], c[2])
      return 'X ' if combination == x
      return 'O ' if combination == o
    end
    return false
  end
end
