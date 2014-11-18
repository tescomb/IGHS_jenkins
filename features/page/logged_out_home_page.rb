require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class LoggedOutHomePage < BasePage

	include Calabash::Android::Operations



	def trait
		"* marked:'signin_btn'"
	end



	def sign_in
		sleep 2
		wait_for_elements_exist [trait], timeout: $wait_time
		touch("* marked:'signin_btn'")
	end



	def sign_out_screen
		puts 'logged out home page'
	end

end