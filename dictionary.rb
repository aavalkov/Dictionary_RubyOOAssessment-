require './lib/word'
require './lib/definition'

@dictionary = []

def main_menu
	loop do
		puts "Welcome to dictionary"
		puts "Press 'a' to add a word, 'l' to list all of your words, or 'r' to remove a word"
		puts "Press 'x' to exit"
		user_choice = gets.chomp
		if user_choice == 'a'
			add_word
		elsif user_choice =='l'
			puts Word.list_words
			puts "Press 'd' to add a definition or any other letter to return to the main menu"
			definition_choice = gets.chomp
			if definition_choice == 'd'
				add_definition
			else
				next
			end		
		elsif user_choice == 'r'	
			remove_word
		elsif user_choice == 'x'
			puts "Bye"
			exit
		else
			puts "You're entered an invalid choice, please choose again"
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
	puts "Enter te number of the word that you'd like to add a definition to:"
	word_choice = gets.chomp.to_i
	puts "Enter the definition:"
	user_definition = gets.chomp
	@dictionary[word_choice-1].add_definitions(Definition.new(user_definition))
end	

main_menu
