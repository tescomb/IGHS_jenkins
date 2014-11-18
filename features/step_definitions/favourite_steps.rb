And(/^i add item to basket from favourites$/) do
	check_product_available
	get_valueof_item_adding
	add_item
	step "i select the basket"
	get_valueof_item_added
end

Then(/^i should see same value under Guide Price$/) do
	assert_same(item_value, item_value_added)
end

Then (/^i should get Favourites selected by default$/) do
	wait_for_elements_exist ["* id:'fav_desc'"], timeout: $wait_time
	items_present=query("* id:'fav_desc'",:text).first
	assert( items_present, 'Favourites disabled' )

# 	wait_for_elements_exist [$favourite_option], timeout: $wait_time
# 	@@favourites_page.select_favourite_default
# 	assert_true(@@favourites_page.fav_status, 'fav is not selected')
 end

Then (/^I verify the favourite tab is disabled$/) do
	wait_for_elements_exist [$favourite_option], timeout: $wait_time
	touch ($favourite_option)
	wait_for_elements_exist [$favourite_tab], timeout: $wait_time
	@@favourites_page.favourite_tab_disabled
	assert(!@@favourites_page.fav_tab, 'Favourite is enabled')
end

And (/^i touch on a recent order$/) do
	@@favourites_page.recent_order
	#assert_true(@@favourites_page.rec_order_tapped, 'The recent order selected is not in selected state')
	wait_for_elements_exist ["* id:'pro_title'"], timeout: $wait_time
end

Then (/^i verify if the recent order price message is displayed$/) do
	@@favourites_page.validatemessage
	assert_true(@@favourites_page.rec__order_message, 'Recent order price message is not displayed')
end

And (/^i verify scroll off is possible$/) do
	@@favourites_page.validatescroll
	assert_true(@@favourites_page.message_scroll_off, 'The recent order price message is not dismissed on scrolling')
end

Then (/^i verify no items in favourites$/) do
	@@favourites_page.no_favourites
	assert_true(@@favourites_page.fav_not_available, 'Products are displayed in favourites for a new user')
end

And (/^i verify no items in usuals$/) do
	@@favourites_page.no_usuals
	assert_true(@@favourites_page.usual_not_available, 'Products are displayed in favourites for a new user')
end

And (/^i verify no recent orders$/) do
	@@favourites_page.no_recent_order
	assert_true(@@favourites_page.rec_not_available, 'Recent orders are displayed for a new user')
end

Then (/^i get my usuals selected$/) do
	@@favourites_page.my_usual_selected
	assert_true(@@favourites_page.usual_selected, 'My usual is not selected on tapping')
end


And (/^i touch on my usuals$/) do
	@@favourites_page.my_usual
	# wait_for_elements_exist [$product_general], timeout: 30
end

And (/^i touch on My Favourites$/) do
	@@favourites_page.my_favourites
	# wait_for_elements_exist [$product_general], timeout: 30
end

Then (/^i verify the count of favourites$/) do
	check_product_available
	@@favourites_page.count_favourites
	@@favourites_page.all_count
	assert_equal(@@favourites_page.fav_count, @@favourites_page.all_count_num, "The count of Favourites and All is not equal")
end

Then (/^i verify the count of usuals$/) do
	check_product_available
	@@favourites_page.count_usuals
	@@favourites_page.all_count
	assert_equal(@@favourites_page.us_count, @@favourites_page.all_count_num, "The count of usuals and All is not equal")
end

Then(/^I read the favourites count$/) do
	wait_for_animate_3sec
	if element_exists $favourites_count
		@@favourites_page.favourites_count
	else
		raise "Favourites count is not available"
	end
end

Then(/^I read the usuals count$/) do
	wait_for_animate_3sec
	if element_exists $usuals_count
		@@favourites_page.usuals_count
	else
		raise "Usuals count is not available"
	end
end

And (/^i add item into basket$/) do
	check_product_available
	get_basket_value_before
	add_item
	get_basket_value_after
end

