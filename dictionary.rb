require './lib/word'
require './lib/definition'

@dictionary = []

def main_menu
	puts "DICTIONARY"
	puts "*" * 50
	loop do
		puts "Words: Press 'a' to add,'l' to list all, or 'r' to remove."
		puts "Definitions: Press 'd' to add, 's' to show, 'f' to find a single one, or any other letter to return to the main menu."
		puts "Press 'x' to exit."
		puts "\n"
		user_choice = gets.chomp
		clear_screen
		if user_choice == 'a'
			add_word
		elsif user_choice == 'd'
			add_definition
		elsif user_choice == 'f'
			word_search
		elsif user_choice == 'l'
			list_words
		elsif user_choice == 'r'
			remove_word	
		elsif user_choice == 's'
			list_all
		elsif user_choice == 'x'
			puts "Bye"
			exit
		else
			puts "You've entered an invalid choice, please choose again"
		end						
	end
end	

def add_word
	puts "Enter the name of the word"
	user_word = gets.chomp
	@dictionary << Word.new(user_word)
	puts "Your word has been added"
end	

def add_definition
	list_words
	puts "Enter the number of the word that you'd like to add a definition to:"
	word_choice = gets.chomp.to_i
	puts "Enter the definition:"
	user_definition = gets.chomp
	@dictionary[word_choice-1].add_definitions(Definition.new(user_definition))
end	

def word_search
	puts "Enter a word to find it's definition"
	puts "If no definition is returned, the word is not in your dictionary."
	word = gets.chomp
	@dictionary.each do |term|
		if term.name.include?(word)
			term.definitions.each do |definition|
				puts definition.description
			end
			break
		end
	end	
end	

def list_words
	@dictionary.each_with_index do |word, index|
		puts "#{index+1}. #{word.name} \n"
	end
end	

def list_all
	list_words
	puts "Enter the number of the word that you'd like to view"
	word_number = gets.chomp.to_i
	@dictionary[word_number-1].definitions.each do |definition|
		puts definition.description
	end	
end	

def remove_word
	list_words
	puts "Enter the number of the word that you'd like to remove"
	word_remove = gets.chomp.to_i
	@dictionary.delete_at(word_remove-1)
end	

def clear_screen
  puts "\e[H\e[2J"
end

main_menu
