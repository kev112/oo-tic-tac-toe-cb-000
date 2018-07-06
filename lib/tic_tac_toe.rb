class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end


  # Helper Methods
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

  def move(index, current_player)
    @board[index] = current_player
  end



  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  # Define your play method below
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

  def turn_count
    i = 0
    @board.each do |item|
      i += 1 if item == 'X' || item == 'O'
    end
    i
  end

  def current_player
    turn_count % 2 == 0 ? 'X' : 'O'
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def won?
    combination = for combination in WIN_COMBINATIONS
      position_1 = @board[combination[0]]
      position_2 = @board[combination[1]]
      position_3 = @board[combination[2]]

      if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
        return combination
      elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
        return combination
      else
        false
      end
    end
    if combination.length == 3
      return combination
    else
      return false
    end
  end

  def full?
    i = 0
    @board.each do
      if position_taken?(i)
        i += 1
        if i == 9
          return true
        end
      else
        return false
      end
    end
  end

  def position_taken?(index)
    @board[index]== "X" || @board[index] == "O"
  end

  def draw?
    !won? && full?
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end


  def winner
    i = 0
    for combination in WIN_COMBINATIONS
      position_1 = @board[combination[0]]
      position_2 = @board[combination[1]]
      position_3 = @board[combination[2]]

      if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
        return 'X'
      elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
        return 'O'
      else
        i += 1
        if i == 8
          return nil
        end
      end
    end
  end


end
