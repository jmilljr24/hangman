require_relative 'game'

def input
  selection = gets.chomp.downcase
#  if selection == 'save'
#  end
  game = Game.new if selection == '1'
end

game = Game.new
game.play