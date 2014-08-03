require 'rspec'
require 'word'
require 'definition'

describe 'Word' do
	it 'is initialed with a name' do
		new_word = Word.new('Dinosaur') 
		new_word.should be_an_instance_of Word
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