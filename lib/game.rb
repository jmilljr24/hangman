class Game
  attr_writer :current_guess

  def initialize
    @key = key_word
    @guesses_remaining = 10
    @key_clues = []
    @key.length.times { @key_clues << '_' }
    @letters_guessed = []
  end

  def key_word
    word_list = File.read('words.txt').split
    word = ''
    word = word_list.sample until 4 < word.length && word.length < 13
    word
  end

  def display
    puts <<-HEREDOC

    Make your guess! You have #{@guesses_remaining} guesses remaining.

          #{@key_clues.join(' ')}

          #{@letters_guessed.join(' ')}
    HEREDOC
  end

  def input
    user_input = gets.chomp.downcase
    if user_input == 'save'
      user_input
    elsif user_input.length == 1 and user_input.match?(/[a-z]/)
      user_input
      @letters_guessed << user_input
    else
      puts 'Please enter one letter A-Z'
    end
  end
end
