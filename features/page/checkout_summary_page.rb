require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class CheckoutSummary < BasePage
	include Calabash::Android::Operations
	include Common_id



	def trait
		"* marked:'HeaderTitle'"
	end

	def proceed_to_payment_tab
		## to account for longer screens we will do this until there is a better
		sleep 4.0
		5.times { performAction "scroll_down" }
		sleep 5.0
		touch "webview css:'DIV' id:'nextStage'"
		wait_for_elements_do_not_exist ["webview css:'DIV' id:'nextStage'"], timeout: 45
	end

end
