require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class LoginPage < BasePage
	include Calabash::Android::Operations



	def trait
		"* id:'forget_pwd'"
	end



	def login
		wait_for_elements_exist [$sign_button], timeout: $wait_time
		touch($sign_button) if element_exists $sign_button
		sleep 2
	end



	def new_user_credential
		query($username_field, :setText => $new_username)
		query($password_field, :setText => $new_password)
	end
end