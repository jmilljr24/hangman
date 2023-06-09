require 'yaml'

class Game
  attr_accessor :game_name

  def initialize(game_name = 'default')
    @game_name = game_name
    @key = key_word
    @guesses_remaining = 10
    @key_clues = []
    @key.length.times { @key_clues << '_' }
    @letters_guessed = []
  end

  def key_word
    word_list = File.read('words.txt').split
    word = ''
    word = word_list.sample until word.length > 4 && word.length < 13
    word
  end

  def display
    text = if @guesses_remaining == 1
             'guess'
           else
             'guesses'
           end
    puts <<-HEREDOC

    Make your guess! You have #{@guesses_remaining} #{text} remaining.

          #{@key_clues.join(' ')}

          #{@letters_guessed.join(' ')}
    HEREDOC
  end

  def input
    @user_input = gets.chomp.downcase
    return if @user_input == 'quit'

    if @user_input == 'save'
      save
    elsif @letters_guessed.include?(@user_input)
      puts 'That letter has already been used. Silly mistake! Try again...'
    elsif @user_input.length == 1 && @user_input.match?(/[a-z]/)
      @letters_guessed << @user_input
    else
      puts 'Please enter one letter A-Z'
      @guesses_remaining += 1
    end
  end

  def input_check
    return if @key.include?(@user_input)

    @guesses_remaining -= 1
  end

  def update_clue
    a = @key.split('')
    a.each_with_index do |letter, i|
      @key_clues[i] = @user_input if letter == @user_input
    end
  end

  def play
    until over?
      display
      input
      update_clue
      input_check
    end
  end
end

def over?
  if @key_clues.join == @key
    puts "#{@key_clues.join(' ')}"
    puts 'You win!!'
    true
  elsif  @guesses_remaining.zero?
    puts "You lose! The word was #{@key}."
    true
  elsif @user_input == 'save' || @user_input == 'quit'
    true
  end
end

def save
  @user_input = ''
  serialized_object = YAML.dump(self)
  puts "Your game is saved as #{game_name}"
  File.open("#{game_name}.yaml", 'w') do |file|
    file.write serialized_object
  end
  @user_input = 'save'
end
