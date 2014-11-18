class Variable

	attr_accessor :value



	def increment(value)
		self.value=value
	end



	def inc(i)
		i =i-1
		self.increment(i)
	end
end

=begin
sai=Variable.new
sai.inc
puts sai.value
sai.inc
puts sai.value
=end
