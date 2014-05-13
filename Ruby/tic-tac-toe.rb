module TicTacToe

  class Space
    attr_accessor :value
    def initialize(value = ' ')
      @value = value
    end
  end

  class Board
    attr_reader :game_board

    def initialize
     @game_board = new_board
    end

    def get_space(x,y)
      self.game_board[y][x]
    end

    def set_space(x,y,val)
      get_space(x,y).value = val
    end

    def print
      self.game_board.reverse_each {|row| puts row.map {|space| space.value}.to_s}
    end

    def space_available?(x,y)
      if get_space(x,y).value == ' '
        return true 
      else
        puts "\nSpot taken, try again!"
        return false
      end
    end

    private
      def new_board
        Array.new(3) { Array.new(3) { Space.new } }
      end
      #end board
  end

  class Player
    attr_reader :symbol
    def initialize(symbol)
      @symbol = symbol
    end
  end

  class Game

    def play(p1,p2,board)
      current_player = p1
      board.print
      loop do
        player_turn(current_player,board)
          if winner?(board,current_player)
            puts "#{current_player.symbol} wins!"
            break
          end
        current_player == p1 ? current_player =  p2 : current_player = p1
      end
    end

    def player_turn(player, board)
      begin
        puts "Please enter X and Y coordinates separated by a space.\nFor example '0 0' is the bottom left corner"
        mark = gets.chomp.split(' ').map {|x| x.to_i}
        board.space_available?(mark[0], mark[1]) ? board.set_space(mark[0], mark[1], player.symbol)  : player_turn(player, board)
      rescue 
        puts "\nBad Input! Try again!"
        retry
      else
        board.print
        puts "\nMove made!\n" 
      end
    end

    def winner?(board,player)0
      return true if vertical_win(board,player)
      return true if horizontal_win(board,player)
      return true if diagonal_win(board,player)
    end

    def horizontal_win(board,player)
      flag = false
      board.game_board.collect do |row|
       flag = true if row.all? {|e| e.value == player.symbol}
      end
      flag
    end

    def vertical_win(board,player)
      flag = false
      board.game_board.transpose.collect do |row|
       flag = true if row.all? {|e| e.value == player.symbol}
      end
      flag
    end

    def diagonal_win(board,player) 
      return true if [board.get_space(0,0), board.get_space(1,1), board.get_space(2, 2)].all? {|e| e.value == player.symbol}
      return true if [board.get_space(0,2), board.get_space(1,1), board.get_space(2,0)].all?  {|e| e.value == player.symbol}
    end
  #game end
  end
  #module end
end

board = TicTacToe::Board.new
p1 = TicTacToe::Player.new('X')
p2 = TicTacToe::Player.new('O')

g = TicTacToe::Game.new.play(p1,p2,board)