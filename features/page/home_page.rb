require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class HomePage < BasePage
	include Calabash::Android::Operations



	def trait
		$dasboard_welcome_text
	end



	def login
		wait_for_elements_exist [$sign_button], timeout: $wait_time
		touch($sign_button) if element_exists $sign_button
	end



	def sign_in
		sleep 2
		wait_for_elements_exist [$sign_button], timeout: $wait_time
		touch($sign_button)
	end



	def browse_option
    sleep 2
		wait_for_elements_exist [$browse_option_button], timeout: $wait_time
		touch $browse_option_button
		seasonal_buylist = "* marked:'Browse Groceries'"
		if seasonal_buylist
			puts "Browse all groceries displayed successfully"
		else
			puts "Browse all groceries not displayed successfully"
		end
	end
end


