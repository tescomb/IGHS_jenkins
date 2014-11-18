require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class MyRecentOrderPage < BasePage
	include Calabash::Android::Operations



	def trait
		"* id:'HeaderTitle' {text contains 'Order '}"
	end

end


