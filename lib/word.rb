class Word

@@dictionary = []

	def initialize(name)
		@name = name
		@definitions = []
		@@dictionary << self
	end

	def name
			@name
	end

	def definitions
		@definitions
	end	

	def Word.dictionary
		@@dictionary
	end	

	def Word.list_words
		result = ""
		@@dictionary.each_with_index do |word, index|
			result += "#{index+1}. #{word.name} \n"
		end
		result	
	end	

	def add_definitions(definition)
		@definitions << definition
	end
end	 