require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class LeftHandNavigationPage < BasePage
	include Calabash::Android::Operations



	def trait
		#set_attributes
		"* marked:'title'"
	end



	def set_attributes
		# You should set attributes
		# whenever you scroll
		# whenever you swipe
		# whenever you arrive at a new page
		query "* id:'title' index:1", setContentDescription: "HOME"
		query "* id:'title' index:2", setContentDescription: "SHOP_ALL_GROCERIES"
	end



	def choose_navigation(navigation_item)
		wait_for_elements_exist ["* marked:'#{navigation_item}'"], timeout: $wait_time
		query_string = "tescoui.customfontcomponents.RobotoTextView {text contains'#{navigation_item}'}"
		sleep 1
		if navigation_item == 'Book a Slot'
			begin
				book_a_slot=query("* marked:'Book a Slot'").size-1
				touch "* marked:'Book a Slot' index:#{book_a_slot}"
			rescue
         fail 'Book a slot is not loaded'
			end
		elsif navigation_item == 'Special Offers'
			special_offer=query("* marked:'Special Offers'").size-1
			touch "* marked:'Special Offers' index:#{special_offer}"
		elsif
			navigation_item == 'Browse all groceries'
			book_a_slot=query("* marked:'Browse all groceries'").size-1
			touch "* marked:'Browse all groceries' index:#{book_a_slot}"
			wait_for_elements_exist ["* marked:'Browse Groceries'"], timeout: $wait_time
		else
			touch query_string
		end
	end
end