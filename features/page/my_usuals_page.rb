require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class MyUsualsPage < BasePage
	include Calabash::Android::Operations



	def trait
		"grocery.droid.common.RobotoTextView id:'HeaderTitle' {text contains[c] 'My Usuals'}"
	end

end
