require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class LogoutPage < BasePage
	include Calabash::Android::Operations



	def trait
		"* id:'dialog_title'"
	end



	def do_logout
		wait_for_elements_exist ["* id:'ok_btn'"], timeout: $wait_time
		touch "* id:'ok_btn'"
	end
end