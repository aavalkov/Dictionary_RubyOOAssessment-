require 'rspec'
require 'word'
require 'definition'

describe 'Word' do
		
	it 'is initialed with a name' do
		new_word = Word.new('Dinosaur') 
		new_word.should be_an_instance_of Word
	end

	it 'lets you read out a word' do
		new_word = Word.new('Dinosaur')
		new_word.name.should eq 'Dinosaur'
	end

	it 'adds a definition to word' do
		new_word = Word.new('Dinosaur') 
		new_word.add_definitions('My favorite animal').should eq ['My favorite animal']
	end	

	it 'lists all of the words in the dictionary' do
		new_word = Word.new('Dinosaur') 
		anoteher_new_word = Word.new('T-Rex')
		Word.list_words.should eq "1. Dinosaur 2.T-Rex" 	
	end
end		

describe 'Definition' do
	it 'is initialized with a definition' do
		new_definition = Definition.new('My favorite animal')
		new_definition.should be_an_instance_of Definition
	end

	it 'lets you read out a definition' do
		new_definition = Definition.new('My favorite animal')
		new_definition.description.should eq 'My favorite animal'
	end
end	