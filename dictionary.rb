require './lib/word'
require './lib/definition'

@dictionary = []

def main_menu
	loop do
		puts "Dictionary"
		puts "Press 'a' to add a word,'l' to list all of your words, or 'r' to remove a word"
		puts "Press 'x' to exit"
		user_choice = gets.chomp
		if user_choice == 'a'
			add_word
		elsif user_choice =='l'
			puts Word.list_words
			puts "Press 'd' to add a definition, 's' to show a definition, 'f' to find a definition, or any other letter to return to the main menu"
			definition_choice = gets.chomp
			if definition_choice == 'd'
				add_definition
			elsif definition_choice == 's'
				list_all
			elsif definition_choice == 'f'
				word_search
			elsif definition_choice == 'r'
				remove_word
			else
				next
			end		
		elsif user_choice == 'r'	
			remove_word
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

def word_search
	puts "Enter a word to find it's definition"
	word = gets.chomp
	@dictionary.each do |term|
		if term.name.include?(word)
			term.definitions.each do |definition|
				puts definition.description
			end
			break
		else
			puts "That word is not in your dictionary"
			break
		end
	end
end	

def add_definition
	puts "Enter the number of the word that you'd like to add a definition to:"
	word_choice = gets.chomp.to_i
	puts "Enter the definition:"
	user_definition = gets.chomp
	@dictionary[word_choice-1].add_definitions(Definition.new(user_definition))
end	

def list_all
	puts Word.list_words
	puts "Enter the number of the word that you'd like to view"
	word_number = gets.chomp.to_i
	@dictionary[word_number-1].definitions.each do |definition|
		puts definition.description
	end	
end	

def remove_word
	puts Word.list_words
	puts "Enter the number of the word that you'd like to remove"
	word_remove = gets.chomp.to_i
	@dictionary.delete_at(word_remove-1)
	Word.dictionary.delete_at(word_remove-1)
end	

main_menu
