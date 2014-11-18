require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'

class AmendPage < BasePage
	include Calabash::Android::Operations



	def save_amend
		wait_for_elements_exist [$save_amend_button], timeout: $wait_time
		touch($save_amend_button)
		sleep 2
	end



	def confirm_amend?
		dialog_desc = "* id:'ok_btn'"
		sleep(5)
		if element_exists $continue_button
			wait_for_elements_exist [$continue_button], :timeout => $wait_time
			touch $continue_button
		else
			wait_for_elements_exist [dialog_desc], timeout: $wait_time
			touch("* id:'ok_btn'")

			#wait_for_animate
			#puts "Order Confirmation message is displayed "
		end
	end



	def continue_amend
		wait_for_elements_exist [$continue_button], :timeout => $wait_time
		touch($continue_button)
	end



	def saved_ok_amend
		dialog_desc = "* id:'ok_single_btn'"
		wait_for_elements_exist [dialog_desc], timeout: $wait_time
		touch(query(dialog_desc))
		wait_for_elements_do_not_exist ["* id:'LoadingProgress'"], timeout: $wait_time
		if element_exists "* marked:'Continue'"
			touch("* marked:'Continue'")
			wait_for_elements_do_not_exist ["* id:'LoadingProgress'"], timeout: $wait_time
			touch("* marked:'Ok'")
		end
	end


end

