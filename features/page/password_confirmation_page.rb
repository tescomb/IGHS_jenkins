require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class PasswordConfirmationPage < BasePage

	include Calabash::Android::Operations



	def trait
		"webview css:'INPUT' id:'password'"
	end



	def enter_password
		wait_for_elements_exist ["webview css:'INPUT' id:'password'"], timeout: 30
		set_text "webview css:'INPUT' id:'password'", "qwerty"
	end



	def proceed_to_checkout
		wait_for_elements_exist ["webview css:'INPUT' id:'un_bluebtn'"], timeout: 30
		touch "webview css:'INPUT' id:'un_bluebtn'"
		# wait_for_elements_do_not_exist ["webview css:'INPUT' id:'un_bluebtn'"], timeout: 30
	end


end