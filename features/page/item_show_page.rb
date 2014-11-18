require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class ItemShowPage < BasePage
	include Calabash::Android::Operations



	def trait
		"* id:'add_btn'"
	end



	def on_item?(item_name)
		element_exists "* id:'HeaderTitle' {text contains[c] '#{item_name}'}"
	end

end