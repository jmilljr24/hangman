require_relative 'game'

def input
  letter = gets.chomp
  puts letter
end

game = Game.new
game.play