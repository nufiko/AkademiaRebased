gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'tictactoe'

class TicTacToeTest < Minitest::Test

	def test_add_symbol
		game = Tictactoe.new
		assert_equal true, game.addSymbol(1,1,'a')
	end
	
	def test_is_occupied
		game = Tictactoe.new
		game.addSymbol(0,1,'a')
		assert_equal false, game.addSymbol(0,1,'b')
	end
	
	def test_check_line
		game = Tictactoe.new
		game.addSymbol(0,0,'a')
		game.addSymbol(0,1,'a')
		game.addSymbol(0,2,'a')
		assert_equal true, game.isRow(0)
	end
	
	def test_check_column
		game = Tictactoe.new
		game.addSymbol(0,1,'a')
		game.addSymbol(1,1,'a')
		game.addSymbol(2,1,'a')
		assert_equal true, game.isColumn(1)
	end
	
	def test_check_diagonal
		game = Tictactoe.new
		game.addSymbol(0,0,'a')
		game.addSymbol(1,1,'a')
		game.addSymbol(2,2,'a')
		assert_equal true, game.isDiagonal()
	end
	
	def test_is_win
		game = Tictactoe.new
		game.addSymbol(0,1,'a')
		game.addSymbol(1,1,'a')
		game.addSymbol(2,1,'a')
		assert_equal true, game.whoWins()
	end
	
end