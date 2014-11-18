require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class Payment < BasePage
	include Calabash::Android::Operations
	include Common_id



	def trait
		"webView css:'div' {html contains 'Payment'}"
	end



	def enter_payment_credentials_tab
		enter_card_name_tab
		enter_card_number_tab
		select_month_tab
		select_year_tab
		enter_security_code_tab
	end



	def enter_card_name_tab
		query_string = "webview css:'INPUT' {html contains 'cardName' }"

		Timeout::timeout(30) do
			while !visible?(query_string) do
				# performAction "scroll_down"
				scroll_down_a_bit
			end
		end

		set_text query_string, "Xamarin TestCloud"
	end



	def enter_card_number_tab
		query_string = "webview css:'INPUT' {html contains 'cardNumber' }"

		Timeout::timeout(30) do
			while !visible?(query_string) do
				# performAction "scroll_down"
				scroll_down_a_bit
			end
		end

		set_text query_string, "4444333322221111"
	end



	def select_month_tab
		touch "webview css:'SELECT' id:'expireMonth-0'"
		begin
			wait_for_elements_exist ["android.widget.CheckedTextView"]
			performAction "scroll_down"
			sleep 0.5
			touch "android.widget.CheckedTextView index:1"
			sleep 0.5
			touch "android.widget.Button id:'WebSelectDone'"
			wait_for_elements_do_not_exist ["android.widget.CheckedTextView"]
		rescue
			touch "android.widget.TextView index:2"
			# wait_for_elements_do_not_exist ["android.widget.TextView"]
		end
	end



	def select_year_tab
		touch "webview css:'SELECT' id:'expireYear-0'"
		begin
			wait_for_elements_exist ["android.widget.CheckedTextView"]
			performAction "scroll_down"
			sleep 0.5
			touch "android.widget.CheckedTextView index:1"
			sleep 0.5
			touch "android.widget.Button id:'WebSelectDone'"
			wait_for_elements_do_not_exist ["android.widget.CheckedTextView"]
		rescue
			touch "android.widget.TextView index:2"
			# wait_for_elements_do_not_exist ["android.widget.TextView"]
		end
	end



	def enter_security_code_tab
		query_string = "webview css:'INPUT' {html contains 'securityCode' }"

		Timeout::timeout(30) do
			while !visible?(query_string) do
				# performAction "scroll_down"
				scroll_down_a_bit
			end
		end

		set_text query_string, "123"
	end



	def confirm_payment_tab
		sleep 3.0
		4.times { scroll_down }
		sleep 5.0
		#touch "webview css:'INPUT' value:'Confirm Order'"
		touch "webview css:'INPUT' value:'Confirm Payment'"
		sleep 7.0
		wait_for_elements_do_not_exist ["webview css:'INPUT' value:'Confirm Order'"], timeout: 55
	end



	def forgot_password
		forgot_password_link= "webView css:'text' {html contains 'Forgot your password?'}"
		wait_for_elements_exist [forgot_password_link, timeout: $wait_time]
		touch (forgot_password_link)
	end

end