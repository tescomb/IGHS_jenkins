require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class SearchShowPage < BasePage
	include Calabash::Android::Operations



	def trait
		"grocery.droid.common.RobotoEditText id:'SearchEditText'"
	end



	def search_text?(search_name)
		element_exists "grocery.droid.common.RobotoTextView id:'HeaderTitle' {text contains[c] '#{search_name}'}"
	end



	def select selection

	end
end