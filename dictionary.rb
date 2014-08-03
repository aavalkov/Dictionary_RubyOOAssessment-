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
			list_words
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

main_menu