require_relative 'game'
require 'pry-byebug'
require 'yaml'

end_program = ''
@load_name = ''
# name = ''
# game = nil

puts <<~'HEREDOC'

                HANGMAN

  Make a Selection: (1) for a New Game
                    (2) for a Saved Game

  Type 'save' to save and exit a game while playing.
  Type 'quit' to end the program.

HEREDOC
# def load_game
#  YAML.safe_load File.read("#{@load_name}.yaml")
# end

until end_program == 'quit'
  # git  binding.pry
  selection = gets.chomp.downcase
  end_program = 'quit' if selection == 'quit'
  if selection == '1'
    puts 'Enter a name for this game'
    name = gets.chomp
    game = Game.new(name)
    game.play
  elsif selection == '2'
    puts 'saved game test'
    #  binding.pry
    @load_name = gets.chomp
    saved_game = File.read("#{@load_name}.yaml")
    p game = YAML.unsafe_load(saved_game)
    game.play
  end
  puts <<~'HEREDOC'

                 HANGMAN

    Make a Selection: (1) for a New Game
                      (2) for a Saved Game

    Type 'save' to save and exit a game while playing.
    Type 'quit' to end the program.

  HEREDOC
end
