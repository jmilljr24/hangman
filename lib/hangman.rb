require_relative 'game'
require 'yaml'

end_program = ''
@load_name = ''

puts <<~'HEREDOC'

                HANGMAN

  Make a Selection: (1) for a New Game
                    (2) for a Saved Game

  Type 'save' to save and exit a game while playing.
  Type 'quit' to end the program.

HEREDOC

until end_program == 'quit'
  selection = gets.chomp.downcase
  end_program = 'quit' if selection == 'quit'
  if selection == '1'
    puts 'Enter a name for this game'
    name = gets.chomp
    game = Game.new(name)
    game.play
  elsif selection == '2'
    saved_list = Dir['*.yaml']
    puts 'Saved Games:'
    saved_list.each do |file|
      puts File.basename(file, '.yaml')
    end
    puts 'Enter the name of the saved game.'
    @load_name = gets.chomp until saved_list.include?("#{@load_name}.yaml")
    saved_game = File.read("#{@load_name}.yaml")
    game = YAML.unsafe_load(saved_game)
    game.play
    @load_name = ''
  end
  puts <<~'HEREDOC'

                 HANGMAN

    Make a Selection: (1) for a New Game
                      (2) for a Saved Game

    Type 'save' to save and exit a game while playing.
    Type 'quit' to end the program.

  HEREDOC
end
