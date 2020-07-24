class TicTacToe
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
def input_to_index(current)
  new_input=current.to_i
  return new_input -= 1
end

def move(index,character)
  return @board[index]=character
end

def position_taken?( index)
  @board[index] != " "
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
   counter = 0
   @board.each do |spaces|
      if spaces == "X" || spaces == "O"
         counter += 1
      end
   end
   counter
end

def current_player
  turn = turn_count
  if(turn %2 ==0)
    return "X"
  else
    return "O"
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  current=current_player

  if valid_move?( index)
    move(index,current)
    display_board
  else
    puts "try it again"
    turn
  end
end

def winner(board)
  index=[]
  index=won?
  if index==false
    return nil
  else
    if @board[index[0]]== "X"
      return "X"
    else
      return "O"
    end
  end
end






def won?
  WIN_COMBINATIONS.each {|wc|
    win_index_1 = wc[0]
    win_index_2 = wc[1]
    win_index_3 = wc[2]

    p1= @board[win_index_1]
    p2 = @board[win_index_1]
    p3 = @board[win_index_3]

    if p1== "X" && p2 == "X" && p3 == "X"
      return wc
    elsif p1 == "O" && p2 == "O" && p3 == "O"
      return wc
    end
  }
  return false
end
def full?
  @board.all? {|index| index == "X" || index == "O"}
end

def draw?
  if !won? && full?
    return true
  else
    return false
  end
end

def over?
  if won? || draw?
    return true
  else
    return false
  end
end





def play
  until over? == true
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
end
