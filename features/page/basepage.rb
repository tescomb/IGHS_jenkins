require File.dirname(__FILE__) + '/../../features/support/helpers'
class BasePage
 include Tesco
	def trait
		raise "You should define a trait method or a title method" unless respond_to?(:title)
		"* marked:'#{self.title}'"
	end



	def embed(*args)
		puts "Embed is a Cucumber method and is not available in this console."
	end



	def await(wait_opts={})
		if trait.kind_of?(Array)
			trait_array = trait
		else
			trait_array = [trait]
		end
		wait_for_elements_exist(trait_array, wait_opts)
		self
	end
end