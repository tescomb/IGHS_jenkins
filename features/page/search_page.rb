require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class SearchPage < BasePage
	include Calabash::Android::Operations

	attr_accessor :no_products



	def store_empty_product(no_products)
		self.no_products=no_products
	end



	def trait
		"* id:'SearchEditText'"
	end



	def scan_button?
		if element_exists "* marked:'scan_btn'"
			"The scan button is there!"
		else
			raise "The option to scan an item is not present"
		end
	end



	def search_for(item)
		wait_for_elements_exist ["* id:'SearchEditText' "], timeout: $wait_time
		query("* id:'SearchEditText' ", :setText => "#{item}")
	end



	def suggested_items?
		wait_for_elements_exist ["* id:'grid_textview'"]
	end



	def select_suggested_search_item
		wait_for_elements_exist ["* id:'grid_textview'"], timeout: $wait_time
		touch("* id:'grid_textview'")
	end

	def empty_products
		wait_for_animate_5sec
		empty_state= element_exists($no_products)
		self.store_empty_product(empty_state)
	end

  def scan_it
	wait_for_elements_exist ["* id:'scan_btn'"], timeout: $wait_time
	touch("* id:'scan_btn'")
  end

	def clear_all_history
	wait_for_elements_exist [$clear_all_text], timeout: $wait_time
	touch($clear_all_text)
	end

end