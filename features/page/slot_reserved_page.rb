require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class SlotReservedPage < BasePage
	include Calabash::Android::Operations



	def trait
		"* id:'HeaderTitle' {text contains[c] 'slot reserved'}"
	end

  def continue_slot_details
	if  element_exists "* id:'continue_btn'"
		touch "* id:'continue_btn'"
	end
  end

	def continue_checkout
		begin
			wait_for_elements_exist ["* id:'continue_btn'"], timeout: 30
			sleep 2.0
			touch "* id:'continue_btn'"
			wait_for_elements_exist ["* id:'check_out_btn'"], timeout: 30
			unless  element_exists "* id:'check_out_btn'"
				touch "* id:'check_out_btn'"
			end
			wait_for_elements_do_not_exist "* marked:'LoadingProgress'", timeout: $wait_time
			if  element_exists "* id:'continue_btn'"
				touch "* id:'continue_btn'"
			end
		rescue
			if  element_exists "* id:'check_out_btn'"
				touch "* id:'check_out_btn'"
			else
				if  element_exists "* id:'continue_btn'"
					touch "* id:'continue_btn'"
				else
					puts 'nothing'
				end
			end
		end
	end

end