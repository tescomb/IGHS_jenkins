And (/^I cancel any outstanding changes$/) do
	# binding.pry
	if outstanding_changes?
		cancel_order_changes
	end
end

Then(/^I can cancel amend order$/) do
	wait_for_elements_exist ["* marked:'cancelAmend'"], timeout: $wait_time
	touch("* marked:'cancelAmend'")
	wait_for_elements_exist ["* marked:'ok_btn'"], timeout: $wait_time
	touch("* marked:'ok_btn'")
end

And(/^I save changes to the amend order$/) do
	@@amend_page.save_amend
	@@amend_page.confirm_amend?
	@@amend_page.continue_amend
	@@amend_page.saved_ok_amend
end

Then(/^I verify the change slot restriction message in amend mode$/) do

end

Then(/^I tap on my order option from LHN$/) do
	open_side_nav
	@@login_from_lhn.choose_navigation('Sign in')
end

Then(/^I tap on previous order$/) do
	@@my_order_page.my_previous_order
end

Then /^I confirm Signout$/ do
	@@logout_page.do_logout
end

Then /^I tap on pending order$/ do
	@@my_order_page.my_pending_order
end

Then(/^I can cancel all amend order$/) do
	@@my_order_page.clear_all_orders
end

Then(/^I tap on Browse button$/) do
	@@home_page.browse_option
end

Then(/^I tap on the make changes button to get into amend mode$/) do
	@@home_page.make_changes
end
