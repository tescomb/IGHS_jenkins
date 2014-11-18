Then(/^i close the modal pop up$/) do
  @@shop_page.close_pdp_screen
end

Then(/^I verify the booked slot in just checking screen$/) do
  @@justchecking_page.justchecking_book_slot
end

Then(/^I change the slot book$/) do
  @@choose_a_slot_page.select_time_tab
  @@slot_reserved_page.continue_checkout
end

And(/^i change the slot/) do
	step 'I wait for the view with id "LoadingProgress" to disappear with loop 2'
	@@choose_a_slot_page.swipe_dates
	@@choose_a_slot_page.select_date
	@@choose_a_slot_page.select_time
	@@book_a_slot_page.get_reserved_details
end

Then(/^I verify the just checking summary$/) do
  pending
end

Then(/^i open side nav$/) do
  open_side_nav
end

Then(/^I change the order type from CC to HD$/) do
  @@justchecking_page.nav_book_slot
  @@book_a_slot_page.home_delivery
  @@choose_a_slot_page.swipe_dates
  @@choose_a_slot_page.select_date
  @@choose_a_slot_page.select_time
  @@book_a_slot_page.get_reserved_details
end

Then(/^I change the order type from HD to CC$/) do
	@@justchecking_page.nav_book_slot
	@@book_a_slot_page.click_and_collect
	@@book_a_slot_page.select_location
	@@choose_a_slot_page.swipe_dates
	@@choose_a_slot_page.select_date
	@@choose_a_slot_page.select_time
	@@book_a_slot_page.get_reserved_details
end

Then(/^I remove an item from basket or just checking$/) do
  delete_item
  steps %Q{
  And I wait for the view with id "LoadingProgress" to disappear with loop 2
	      }
end

Then(/^i add item to basket or just checking$/) do
  add_item
end

Then(/^I change the slot for click & collect$/) do
  @@justchecking_page.nav_book_slot
  @@choose_a_slot_page.select_time_tab
  @@slot_reserved_page.continue_checkout
end
