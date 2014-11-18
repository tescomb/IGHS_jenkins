require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class MyOrdersPage < BasePage
	include Calabash::Android::Operations



	def trait
		"* id:'HeaderTitle' {text contains[c] 'my orders'}"
	end



	def cancel_order
		# This will by default cancel the most recently placed order.
		query_string = "* id:'cancel_btn'"

		wait_poll until_exists: query_string, timeout: $wait_time do
			sleep 1.0
		end

		touch query_string if element_exists query_string
		wait_for_elements_exist ["* id:'dialog_desc'"], timeout: $wait_time
	end



	def confirm_cancel_order
		wait_for_elements_exist ["* id:'ok_btn'"], timeout: $wait_time
		touch "* id:'ok_btn'"
		wait_for_elements_do_not_exist ["* id:'dialog_desc'"], timeout: $wait_time

		wait_for_elements_exist ["* id:'ok_single_btn'"], timeout: $wait_time
		touch "* id:'ok_single_btn'"
		sleep(5)
=begin
    wait_for_elements_exist ["* id:'previousorder_title'"], timeout: 45
=end
	end



	def scheduled_orders
		if wait_for_elements_do_not_exist ["* id:'cancel_btn'"], timeout: $wait_time
			"There are no scheduled orders"
		else
			"There are still scheduled orders!"
		end
	end



	def make_changes
		# This will by default initiate changes to the most recently placed order.
		make_changes_button = "* id:'amend_btn'"
		wait_for_elements_exist [make_changes_button], timeout: $wait_time
		touch(make_changes_button)
	end



	def clear_all_orders
		open_orders_count = query("* id:'cancel_btn'").size
		open_orders_count.times do
			cancel_order
			confirm_cancel_order
		end
	end



	def my_previous_order
		begin
			previous_order = "* marked:'order_type' index:2"
			wait_for_elements_exist [previous_order], timeout: $wait_time
			touch(previous_order)
		rescue
			raise "This user does not have a previous order"
		end
	end



	def my_pending_order
		pending_order = "* marked:'order_type' index:0"
		wait_for_elements_exist [pending_order], timeout: $wait_time
	end

end

