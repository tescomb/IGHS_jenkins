require File.dirname(__FILE__) + '/../../api/api_wrappers'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
#require_relative File.expand_path(File.dirname(__FILE__) + '/../../android_tablet_sprint/support/env')
#require File.expand_path(File.dirname(__FILE__) + '/../../android_tablet_sprint/page/assert')

#include Test::Unit::Assertions

# noinspection RubyClassVariableUsageInspection

Given(/^i'm triggering the amend from api$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.empty_basket
	@@httparty.cancel_pending_order
	@@httparty.add_item
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_homedelivery
	@@httparty.check_out
	@@httparty.amend_order
end

Given(/^i'm triggering the api for just checking$/) do
	step "i'm setting the prerequisite for checkout"
end

Given(/^i'm triggering the api for just checking for guide price value equal to 25$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.cancel_pending_order
	@@httparty.empty_basket
	@@httparty.add_item_value_twenty_five
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_homedelivery
end

Given(/i'm triggering the amend for pending order$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.empty_basket
	@@httparty.add_item
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_homedelivery
	@@httparty.check_out
	@@httparty.amend_order
end

Given(/i'm triggering the amend for canceling pending order$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.empty_basket
	@@httparty.cancel_one_pending_order
	@@httparty.add_item
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_homedelivery
	@@httparty.check_out
	@@httparty.amend_order
end

Given(/i'm triggering the amend for changing a slot for Home delivery$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.empty_basket
	@@httparty.cancel_pending_order
	@@httparty.add_item
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_homedelivery
	@@httparty.check_out
	@@httparty.amend_order
end

Given(/i'm triggering the amend for changing a slot for click and collect$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.empty_basket
	@@httparty.cancel_pending_order
	@@httparty.add_item
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_click_and_collect
	@@httparty.check_out
	@@httparty.amend_order
end

Given(/^i'm triggering the amend from api for sanity$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.cancel_one_pending_order
	@@httparty.empty_basket
	@@httparty.add_item
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_homedelivery
	@@httparty.check_out
end

Given(/^i'm triggering the api for the shop checkout$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.empty_basket
	@@httparty.add_item
	@@httparty.addrress_slot_change
end

Given(/^i'm triggering the api for the basket$/) do
	step "i'm triggering a empty basket api"
end

Given(/^i'm triggering the api for the missed promotions$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.empty_basket
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_homedelivery
	@@httparty.add_item_missed_promotion
end

Given(/^i'm triggering the api for the rdg message$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.empty_basket
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_homedelivery
	@@httparty.add_item_rdg_message
end

When(/^i login to the application$/) do
	# noinspection RubyClassVariableUsageInspection
	@@home_page.login
	credentials=ENV['LOGIN'].split(':')
	enter_credentials(credentials[0], credentials[1])
	# noinspection RubyClassVariableUsageInspection
	@@home_page.sign_in
end

Then(/^verify the order is in amend state$/) do
	wait_for_elements_exist [$Cancel_amend], timeout: $wait_time
	assert_element_on_screen('Cancel changes')
	touch($Cancel_amend)
	wait_for_elements_exist [$ok_button], timeout: $wait_time
	touch($ok_button)
	wait_for_elements_exist [$username_logged], timeout: $wait_time
end


Given(/^i'm setting the prerequisite for checkout$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.cancel_pending_order
	@@httparty.empty_basket
	@@httparty.add_item
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_homedelivery
end

Given(/^i'm triggering a empty basket api$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.empty_basket
end

Given(/^i'm triggering add item api$/) do
	@@httparty.login_access
	@@httparty.empty_basket
	@@httparty.add_item_multiple(2)
end

Given(/^i'm triggering clean api for book a slot$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.cancel_pending_order
	@@httparty.addrress_slot_change
	@@httparty.add_item_multiple(10)
end

Given(/^i'm triggering clean api$/) do
	@@httparty.login_access
	@@httparty.cancel_pending_order
	@@httparty.empty_basket
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_homedelivery

end

Given(/^i'm triggering get product count api$/) do
	@@httparty.login_access
	@@httparty.get_searchproduct_count
	puts @@httparty.total_search_count
end

Given(/^i'm triggering get product count api in anonymous$/) do
	@@httparty.login_access
	@@httparty.get_searchproduct_count_anonymous
end

Given(/^i'm triggering get product name api$/) do
	@@httparty.login_access
	@@httparty.get_search_product_list
end

Given(/^i'm triggering api to with RDG,missed promotion item and guide price less than 25$/) do
	step "i'm triggering the api for the rdg message"
	@@httparty.add_item
end

Given(/^i'm triggering api to with RDG,missed promotion item and guide price more than 25$/) do
	step "i'm triggering api to with RDG,missed promotion item and guide price less than 25"
	@@httparty.add_item_value_twenty_five
end

Given(/i'm triggering an api for just checking for click & collect order type$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.empty_basket
	@@httparty.cancel_pending_order
	@@httparty.add_item
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_click_and_collect
	@@httparty.check_out
end

Given(/i'm triggering an api for retaining a single pending order for (.*)$/) do |arg|
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.pending_order_size
	if arg.downcase == 'home delivery'
		if @@httparty.order_size_pending > 1
			@@httparty.cancel_pending_order
			@@httparty.add_item
			@@httparty.addrress_slot_change
			@@httparty.book_a_slot_homedelivery
			@@httparty.check_out
			@@httparty.add_item
			@@httparty.book_a_slot_homedelivery
			@@httparty.check_out
			@@httparty.amend_order
		else
			puts 'pending order already exists fo HD'
		end
	elsif arg.downcase == 'click and collect'
		if @@httparty.order_size_pending > 1
			@@httparty.cancel_pending_order
			@@httparty.add_item
			@@httparty.addrress_slot_change
			@@httparty.book_a_slot_click_and_collect
			@@httparty.check_out
			@@httparty.add_item
			@@httparty.book_a_slot_click_and_collect
			@@httparty.check_out
			@@httparty.amend_order
		else
			puts 'pending order already exists for CC'
		end
	end


end

Given(/i'm triggering an api for booking click & collect$/) do
	@@httparty.login_access
	@@httparty.add_item
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_click_and_collect
end

Given(/i'm triggering an clean api with guide price more than 25$/) do
	step "i'm triggering clean api for book a slot"
	@@httparty.empty_basket
	@@httparty.add_item_value_twenty_five
end

Given(/i'm triggering the amend for book a slot for (.*)$/) do |arg|
	@@httparty.login_access
	@@httparty.profile_state
	@@httparty.get_choosen_slot
	if @@httparty.amend_mode.eql?('Y')
		'in amend mode'
		@@httparty.get_choosen_slot
		if @@httparty.cc_hd_info.eql?('True')
			puts 'slot is book in CC'
		else
			puts 'slot is booked in HD'
		end

	else
		@@httparty.pending_order_size
		if @@httparty.order_size_pending > 0
			puts 'Order Existing -- and will be pushed to amend mode'
			@@httparty.amend_order
		elsif      @@httparty.empty_basket
			@@httparty.cancel_pending_order
			@@httparty.add_item
			if arg.downcase == 'home delivery'
				@@httparty.addrress_slot_change
				@@httparty.book_a_slot_homedelivery
				@@httparty.check_out
				@@httparty.amend_order
			elsif arg.downcase == 'click and collect'
				@@httparty.addrress_slot_change
				@@httparty.book_a_slot_click_and_collect
				@@httparty.check_out
				@@httparty.amend_order
			end

		end
	end
end


Given(/^i'm triggering the api to clean book a slot$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.empty_basket
	@@httparty.add_item
	@@httparty.cancel_pending_order
	@@httparty.addrress_slot_change
end


Given(/i'm triggering the amend for canceling pending order for click and collect$/) do
	@@httparty.login_access
	@@httparty.cancel_amend_mode
	@@httparty.empty_basket
	@@httparty.cancel_one_pending_order
	@@httparty.add_item
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_click_and_collect
	@@httparty.check_out
	@@httparty.amend_order
end

Given(/i'm triggering api for book a slot for (.*)$/) do |arg|
	@@httparty.login_access
	@@httparty.get_choosen_slot
	puts @@httparty.slot_booked_info
	if @@httparty.slot_booked_info.eql?('No delivery slot is reserved.')
		if arg.downcase == 'home delivery'
			@@httparty.empty_basket
			@@httparty.cancel_pending_order
			@@httparty.add_item
			@@httparty.book_a_slot_homedelivery
		elsif arg.downcase == 'click and collect'
			@@httparty.empty_basket
			@@httparty.cancel_pending_order
			@@httparty.add_item
			@@httparty.book_a_slot_click_and_collect
		end

	elsif @@httparty.cc_hd_info.eql?('True')
		puts 'slot id booked in CC'
	else
		puts 'slot is booked in HD'
	end

end


Given(/i'm checking if slot is booked$/) do
	@@httparty.login_access
	@@httparty.get_choosen_slot
	@@httparty.deliveryaddress
	pending if @@httparty.slot_booked_info.eql?('No delivery slot is reserved.')
end


And(/^i add multiple items to basket from api with count (.*)$/) do |arg|
	@@httparty.login_access
	@@httparty.add_item_multiple(arg)
end

Given(/^i'm triggering the api to complete checkout for (.*)/) do |arg|
	@@httparty.login_access
	@@httparty.cancel_pending_order
	@@httparty.cancel_amend_mode
	@@httparty.add_item
	@@httparty.addrress_slot_change
	@@httparty.book_a_slot_homedelivery
	if arg.downcase == 'ops'
		@@httparty.check_out_ops
	elsif arg.downcase == 'live'
		@@httparty.check_out
	end

end