require_relative 'game'

def key_word
  word_list = File.read('words.txt').split
  word = ''
  word = word_list.sample until 4 < word.length && word.length < 13
  puts word
end

def input
  letter = gets.chomp
  puts letter
end

input