class Game
  attr_reader :key_clues

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
    puts "Make your  next guess #{@key_clues.join(' ')}"
    puts @key_clues
  end
end
