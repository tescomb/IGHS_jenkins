require File.dirname(__FILE__) + '/../../features/repo_id/ids'
And /^process the checkout with (.*)$/ do |slot_type|
	steps %Q{
	When i click the checkout button
  When I select #{slot_type} from the book a slot page
  And I choose a date with available times
	      }
end

When /^i click the checkout button$/ do
	touch $basket_page_checkout
	@@book_a_slot_page.await timeout: $wait_time
end

When /^I select (.*) from the book a slot page$/ do |slot_type|
	begin
		@@book_a_slot_page.slot_type(slot_type)
	rescue
		dismiss_dialogue
		@@book_a_slot_page.slot_type(slot_type)
	end
end

And (/^I choose a date with available times$/) do
	step 'I wait for the view with id "LoadingProgress" to disappear with loop 2'
	@@choose_a_slot_page.swipe_dates
	@@choose_a_slot_page.select_date
	@@choose_a_slot_page.select_time
	@@book_a_slot_page.get_reserved_details
	@@slot_reserved_page.continue_checkout
end

And(/^i change the slot from basket$/) do
	@@choose_a_slot_page.swipe_dates
	@@choose_a_slot_page.select_date
	@@choose_a_slot_page.select_time
	@@book_a_slot_page.get_reserved_details
	end

And(/^I tap on the continue button on slot details page$/) do
	@@slot_reserved_page.continue_slot_details
end

And(/^i select Click and Collect and choose the nearest location$/) do
	@@book_a_slot_page.click_and_collect
	@@book_a_slot_page.select_location
end

Then /^i should (.*) for home delivery is reserved with correct date$/ do |item|
	#puts @@book_a_slot_page.slot
	step "i open side nav and touch #{item}"
	@@book_a_slot_page.get_reserved_details_side_nav_hd
	#puts @@book_a_slot_page.slot_booked
	assert_two_arrays(@@book_a_slot_page.slot, @@book_a_slot_page.slot_booked, 'Book a slot is not same as did')
end

Then /^i should (.*) for click and collect is reserved with correct date$/ do |item|
	#puts @@book_a_slot_page.slot
	step "i open side nav and touch #{item}"
	@@book_a_slot_page.get_reserved_details_side_nav_cc
	#puts @@book_a_slot_page.slot_booked
	assert_two_arrays(@@book_a_slot_page.slot, @@book_a_slot_page.slot_booked, 'Book a slot is not same as did')
end


And(/^i select Home Delivery and choose a slot$/) do
	@@book_a_slot_page.home_delivery
	@@choose_a_slot_page.select_time_tab
	@@slot_reserved_page.continue_checkout
end

And /^i wait for the view (.*)$/ do |arg|
	sleep 3
	wait_for_elements_exist ["* marked:'#{arg}'"], timeout: $wait_time
end

Then(/^i wait for the view "([^"]*)" to disappear$/) do |arg|
	wait_for_elements_do_not_exist ["* marked:'#{arg}'"], timeout: $wait_time

end

Then(/^i select a address and verify if the selected address is displayed$/) do
	#wait_for_elements_do_not_exist ["* id:'LoadingProgress'"], timeout: $wait_time
	wait_for_elements_exist ["* marked:'address_info'"], timeout: $wait_time
	value_of_address=query("* marked:'address_info'").size-1
	selected_address=query("* marked:'address_info' index:#{value_of_address}", :text).first
	touch "* marked:'address_info' index:#{value_of_address}"
	wait_for_animate_3sec
	wait_for_elements_do_not_exist ["* id:'LoadingProgress'"], timeout: $wait_time
	wait_for_elements_exist ["* id:'delivaryAddress'"], timeout: $wait_time
	changed_address=query("* id:'delivaryAddress'", :text).first
	assert_element_equal(selected_address, changed_address)
end

Then /^i change the slot in amend mode$/ do
	#get the details of slot already booked
	@@book_a_slot_page.get_reserved_details_side_nav_hd
	@@choose_a_slot_page.change_slot_in_amend
	@@book_a_slot_page.get_reserved_details
	@@slot_reserved_page.continue_checkout
end

Then /^i change the slot in amend mode for click and collect$/ do
	#get the details of slot already booked
	@@book_a_slot_page.get_reserved_details_side_nav_cc
	@@choose_a_slot_page.change_slot_in_amend
	@@book_a_slot_page.get_reserved_details
	@@slot_reserved_page.continue_checkout
end

Then(/^i should see the slot is changed in amend mode$/) do
	assert_two_arrays_not_same(@@book_a_slot_page.slot_booked, @@book_a_slot_page.slot)
end

Then(/^i should see the view "([^"]*)" disabled$/) do |id|
	sleep 1
	size_of_element=query("* id:'#{id}'").size-1
	if size_of_element < 0
		expected=query("* id:'#{id}' index:0", :isEnabled).first
		assert_true(!expected, 'Element '+id+' is enabled')
	else
		expected=query("* id:'#{id}' index:#{size_of_element}", :isEnabled).first
		assert_true(!expected, 'Element '+id+' is enabled')
	end

end


Then(/^I see the slot reserved detail modal in book a slot screen$/) do
	@@choose_a_slot_page.select_time_tab
	@@book_a_slot_page.get_reserved_details
end

And(/^I see slot reserved page after booking available slot$/) do
	@@choose_a_slot_page.swipe_dates
	@@choose_a_slot_page.select_date
	@@choose_a_slot_page.select_time
	@@book_a_slot_page.get_reserved_details
end

Then(/^I should tap on the slot and book a slot$/) do
	@@choose_a_slot_page.select_time_tab
	@@book_a_slot_page.get_reserved_details
end

Then(/^i enter postcode on add new address field and search$/) do
	@@book_a_slot_page.enter_postcode_Add_new_address
	performAction('send_key_enter')
end


And(/^I tap on the add new address button$/) do
	@@book_a_slot_page.add_new_address_button
end



Then(/^i fill all details such as select address,select property type, nick name,Daytime number& Evening number$/) do
	@@book_a_slot_page.addnew_address_details
end


Then(/^i add the address by tapping the done button$/) do
	@@book_a_slot_page.Addnew_done_button
end


And(/^i change the address$/) do
	@@httparty.login_access
	@@httparty.deliveryaddress
	names=@@httparty.nickname
	postcode=@@httparty.postcode
	wait_for_elements_exist ["* id:'address_info'"], timeout: $wait_time
	address_count=query("* id:'address_info'").size
	address_count.times do |i|
		selected_value= query("* id:'address_info' index:#{i}", :text).first.start_with?(names)
		if selected_value
			if i <= 0
				touch("* id:'address_info' index:#{i+(address_count-2)}")
				break
			else
				touch("* id:'address_info' index:#{i-1}")
				break
			end
		else
			'nothing'
		end
	end
end


And (/^i select a slot$/) do
	@@choose_a_slot_page.select_time_tab
end


And(/^i get the details of slot reserved$/) do
	step 'I go to my basket'
	@@book_a_slot_page.get_reserved_details_from_basket_cc
	step 'I go back'
end