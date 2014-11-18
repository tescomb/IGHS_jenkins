require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class OrderConfirmationPage < BasePage
	include Calabash::Android::Operations

	### Need to investigate better use of wait_poll in order to utilize the web view helpers

	def trait
		"webview css:'DIV' class:'un_order_number'"
	end



	def tap_okay
		wait_for_elements_exist ["* id:'checkOutOkButton'"]
		touch "* id:'checkOutOkButton'"
	end


end