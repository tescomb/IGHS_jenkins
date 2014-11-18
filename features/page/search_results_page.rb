require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class SearchResultsPage < BasePage
	include Calabash::Android::Operations



	def trait
		"* id:'results_text'"
	end



	def add_search_result_item
		wait_for_elements_exist ["button index:1"]
		touch("button index:1")
	end


end