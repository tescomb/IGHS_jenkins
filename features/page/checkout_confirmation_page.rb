require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'

class CheckoutConfirmation < BasePage
	include Calabash::Android::Operations
	include Common_id



	def trait
		"webview css:'DIV' class:'un_order_number'"
	end



	def tap_okay_tab
		ok_btn_checkout_summary = "* marked:'checkOutOkButton'"
		wait_for_elements_exist [ok_btn_checkout_summary], timeout: $wait_time
		touch(ok_btn_checkout_summary)
		sleep 5
	end


end