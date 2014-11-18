require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class PaymentSummaryPage < BasePage
	include Calabash::Android::Operations

	### Need to investigate better use of wait_poll in order to utilize the web view helpers

	def trait
		"webview css:'DIV' textContent:'Payment summary'"
	end



	def enter_payment_credentials
		enter_card_name
		enter_card_number
		select_month
		select_year
		enter_security_code
	end



	def enter_card_name
		query_string = "webview css:'INPUT' {html contains 'cardName' }"

		Timeout::timeout(30) do
			while !visible?(query_string) do
				scroll_down_a_bit
			end
		end

		set_text query_string, "Xamarin TestCloud"
	end



	def enter_card_number
		query_string = "webview css:'INPUT' {html contains 'cardNumber' }"

		Timeout::timeout(30) do
			while !visible?(query_string) do
				scroll_down_a_bit
			end
		end

		set_text query_string, "4444333322221111"
	end



	def select_month
		query_string = "webview css:'SELECT' id:'expireMonth-0'"

		if !visible?(query_string)
			Timeout::timeout(30) do
				while !visible?(query_string) do
					scroll_down_a_bit
				end
				scroll_down_a_bit
			end
		end


		touch "webview css:'SELECT' id:'expireMonth-0'"
		begin
			wait_for_elements_exist ["android.widget.CheckedTextView"]
			performAction "scroll_down"
			sleep 0.5
			touch "android.widget.CheckedTextView index:1"
			sleep 0.5
			touch "android.widget.Button id:'WebSelectDone'"
			# wait_for_elements_do_not_exist ["android.widget.CheckedTextView"], timeout: 20
			sleep 1.0
		rescue
			touch "android.widget.TextView index:1" if element_exists "android.widget.TextView index:1"
			sleep 1.0
		end
	end



	def select_year
		query_string = "webview css:'SELECT' id:'expireYear-0'"

		if !visible?(query_string)
			Timeout::timeout(30) do
				while !visible?(query_string) do
					scroll_down_a_bit
				end
				scroll_down_a_bit
			end
		end


		touch "webview css:'SELECT' id:'expireYear-0'"
		begin
			wait_for_elements_exist ["android.widget.CheckedTextView"]
			performAction "scroll_down"
			sleep 0.5
			touch "android.widget.CheckedTextView index:1"
			sleep 0.5
			touch "android.widget.Button id:'WebSelectDone'"
			# wait_for_elements_do_not_exist ["android.widget.CheckedTextView"], timeout: 20
			sleep 1.0
		rescue
			touch "android.widget.TextView index:2" if element_exists "android.widget.TextView index:2"
			sleep 1.0
		end
	end



	def enter_security_code
		query_string = "webview css:'INPUT' {html contains 'securityCode' }"

		Timeout::timeout(30) do
			while !visible?(query_string) do
				scroll_down_a_bit
			end
		end

		set_text query_string, "123"
	end



	def confirm_checkout
		#begin
		sleep 3.0
		4.times { scroll_down }
		sleep 5.0
		touch "webview css:'INPUT' value:'Confirm Order'"
		wait_for_elements_do_not_exist ["webview css:'INPUT' value:'Confirm Order'"], timeout: 45
		#rescue
		#fail query("*").to_s
		#end
	end

end