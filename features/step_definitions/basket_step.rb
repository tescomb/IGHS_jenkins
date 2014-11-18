require File.dirname(__FILE__) + '/../../features/repo_id/ids'
Then(/^I should see basket value changes$/) do
	puts basket_count_total_after
	puts basket_count_total_before
	assert_element_not_same(basket_count_total_before, basket_count_total_after)
end
Then(/^I should see guide price value changes$/) do
	assert_element_not_same(@@basket_page.guide_price_before, @@basket_page.guide_price_after)
end

And(/^i select the basket$/) do
	@@basket_page.select_basket
end

When (/^I go to my basket$/) do
	my_basket

end


And(/^I tap on PLP$/) do
	wait_for_elements_exist ["* id:'pro_title'"], timeout: $wait_time
	@@state||=true
	unless query("* id:'pro_title'", :isEnabled).first
		@@state||=false
		performAction('drag', 50, 50, 50, 20, 10)
		sleep 1
		touch($Pdp_screen_button)
	else
		touch($Pdp_screen_button)
	end
end

Then(/^i should not see the item in the basket$/) do
	assert_element_on_screen('Your basket is empty')
end

Then(/^I tap on the empty basket button$/) do
	@@basket_page.empty_basket
end

Then(/^i add multiple items to basket$/) do
	add_mutiple_items
end

Then(/^i swipe the basket from the right hand side$/) do
	performAction('drag', 99, 10, 50, 50, 5)
end

Then(/^I tap on the book a slot details in basket screen$/) do
	wait_for_elements_exist [$change_slot], timeout: $wait_time
	touch($change_slot)
end

Then(/^I remove an item$/) do
	delete_item
end

And (/^I remove an item from PDP$/) do
	get_basket_value_before
	step 'I tap on PLP'
	verify_item_added
	delete_item
	get_basket_value_after
end

And(/^i get the guide price summary from basket method "([^"]*)"$/) do |method_var|
	if method_var.eql? 'Summary Price Before'
		@@basket_page.get_summary_price_before
	else
		@@basket_page.get_summary_price_after
	end

end