require_relative 'game'

end_program = ''
name = ''
game = nil

puts <<~'HEREDOC'

                HANGMAN

  Make a Selection: (1) for a New Game
                    (2) for a Saved Game

  Type 'save' to save and exit a game while playing.
  Type 'quit' to end the program.

HEREDOC

until end_program == 'quit'
  #  binding.pry
  selection = gets.chomp.downcase
  end_program = 'quit' if selection == 'quit'
  if selection == '1'
    puts 'Enter a name for this game'
    name = gets.chomp
    game = Game.new(name)
    game.play
  elsif selection == '2'
    puts 'saved game test'
  end
  puts <<~'HEREDOC'

                 HANGMAN

    Make a Selection: (1) for a New Game
                      (2) for a Saved Game

    Type 'save' to save and exit a game while playing.
    Type 'quit' to end the program.

  HEREDOC
end
