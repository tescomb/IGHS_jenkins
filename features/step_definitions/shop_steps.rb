And(/^i select category to shop$/) do
	@@shop_page.select_category('Fresh Food')
	@@shop_page.select_category('Fresh Fruit')
	@@shop_page.select_category('Dried Fruit & Nuts')
end

And(/^i add item to basket$/) do
	get_basket_value_before
	add_item
	get_basket_value_after
end

And(/^i add item to basket in anonymous mode$/) do
	add_item
end


And(/^i add item to basket from PDP$/) do
	check_product_available
	get_basket_value_before
	step 'I tap on PLP'
	add_item
	get_basket_value_after
end

Then(/^I should see total basket count$/) do
	wait_for_elements_exist ["* id:'results_text'"], timeout: $wait_time
	results=query("* id:'results_text'", :text)[0].split('results')[0].strip.to_i
	assert_element_equal(@@httparty.total_search_count, results)
end

And(/^i click back navigation$/) do
	wait_for_elements_exist ["* marked:'action_bar_up_navigation'"], timeout: $wait_time
	touch "* id:'action_bar_up_navigation'"
end

And(/^i scroll down to see the pagination$/) do

	@@count||=0
	10.times do
		begin
			performAction('drag', 50, 50, 50, 20, 1)
			sleep 1
			if query("* id:'LoadingProgress'", :isEnabled).first != nil
				@@count+=1
				while @@count == 2
					break
				end
			end
		end
	end
end

Then(/^i close the PDP Screen$/) do
	@@shop_page.close_pdp_screen
end

Then(/^i tap on the PDP screen$/) do
	step 'I tap on PLP'
end

Then(/^i tap on the offer product$/) do
	@@shop_page.tap_offer_screen
end

Then(/^i add item to basket from new products$/) do
	get_valueof_item_adding
	add_item
	get_valueof_item_added
end

And(/^i select category to shop for catch by weight$/) do
	@@shop_page.select_category('Fresh Food')
	@@shop_page.select_category('Fresh Meat')
	@@shop_page.select_category('Fresh Beef')
end

Then(/^I navigate to super department PLP with RDG product$/) do
	@@shop_page.plp_catchbyweight_pdp
end

And(/^i sort by (.*)$/) do |arg|

	steps %Q{
	             And i wait for the view Sort by
		           And i wait for the view pro_title
		           And i click on Sort by
		           Then i click on #{arg}
		           And i click on Apply
		           And i wait for the view pro_title
							 And I wait for the view with id "LoadingProgress" to disappear with loop 2
	      }
end

And(/^i filter by (.*)$/) do |arg|
	steps %Q{
	             And i wait for the view Sort by
		           And i wait for the view pro_title
		           And i click on Filter by
		           Then i click on #{arg}
		           And i click on Apply
		           And i wait for the view pro_title
							 And I wait for the view with id "LoadingProgress" to disappear with loop 2
	      }
end


Then(/^I select an item with catch-weight option$/) do
	@@shop_page.select_category('Drinks')
	@@shop_page.select_category('Wine')
	@@shop_page.select_category('White Wine')
end


And(/^i add item to basket for catch by weight$/) do
	if element_exists "* marked:'spinnerSelectedTarget'"
		touch "* marked:'Add'"
	else
		until query("* marked:'spinnerSelectedTarget'",:isEnabled).first
			performAction('drag', 50, 50, 50, 20, 9)
			touch "* marked:'Add'"
		end
	end
end