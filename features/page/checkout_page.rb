require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class CheckoutPage < BasePage
	include Calabash::Android::Operations
	include Common_id

	attr_accessor :checkout_confirmation, :prefilled_email



	def cancel_checkout_confirmation(checkout_confirmation)
		self.checkout_confirmation=checkout_confirmation
	end



	def store_email_state(prefilled_email)
		self.prefilled_email=prefilled_email
	end



	def trait
		"webview css:'INPUT' id:'password'"
	end



	def enter_password_tab
		@@credentials=ENV['LOGIN'].split(':')
		wait_for_elements_exist ["webview css:'INPUT' id:'password'"], timeout: $wait_time
		set_text "webview css:'INPUT' id:'password'", @@credentials[1]
	end



	def basket_checkout_tab
		checkout_button= "* id:'check_out_btn'"
		wait_for_elements_exist [checkout_button], timeout: $wait_time
		touch (checkout_button)
	end



	def continue_checkout_tab
		continue_checkout_button = "* id:'check_out_btn'"
		wait_for_elements_exist [continue_checkout_button], timeout: 10
		touch (continue_checkout_button)
	end



	def proceed_checkout_tab
		sign_in_btn = "webview css:'INPUT' id:'un_bluebtn'"
		touch(sign_in_btn)
		wait_for_elements_do_not_exist([sign_in_btn], timeout: $wait_time)
	end



	def cancel_confirmation
		sleep (10)
		dialog_state = element_exists("* id:'alertdialog'")
		self.cancel_checkout_confirmation(dialog_state)
	end



	def email_prefill
		wait_for_elements_exist ["webview css:'INPUT' id:'loginID'"], timeout: $wait_time
		email_prefill_value = query("webView css:'INPUT' id:'loginID'", "value").first
		self.store_email_state(email_prefill_value)
	end


end