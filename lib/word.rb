class Word
	def initialize(name)
		@name = name
		@definitions = []
	end

	def name
		@name
	end	

	def add_definitions(definition)
		@definitions << definition
	end
end	 