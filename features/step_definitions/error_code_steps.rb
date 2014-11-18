Then (/^i verify the errorcode for list delivery slot (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	@@error_code_page.error_code_delivery_slot(file)
	assert_element_on_screen(arg)
	error_code
end

Then (/^i verify the errorcode for list collection point (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	sleep (10)
	@@error_code_page.error_code_collection_point(file)
	assert_element_on_screen(arg)
	error_code
end

Then (/^i verify the errorcode for list collection slot (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	sleep (10)
	@@error_code_page.error_code_collection_slot(file)
	assert_element_on_screen(arg)
	error_code
end

Then (/^i verify the errorcode for empty basket (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	sleep (10)
	@@error_code_page.error_code_empty_basket(file)
	assert_element_on_screen(arg)
	error_code
end

Then (/^i verify the errorcode for change basket (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	sleep (10)
	@@error_code_page.error_code_change_basket(file)
	assert_element_on_screen(arg)
	error_code
end

Then (/^i verify the errorcode for choose delivery slot (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	sleep (10)
	@@error_code_page.error_code_choose_delivery(file)
	assert_element_on_screen(arg)
	error_code
end

Then (/^i verify the errorcode for choose collection slot (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	sleep (10)
	@@error_code_page.error_code_choose_collection(file)
	assert_element_on_screen(arg)
	error_code
end

Then (/^i verify the errorcode for initiating a checkout (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	sleep (10)
	@@error_code_page.error_code_ready_checkout(file)
	assert_element_on_screen(arg)
	error_code
end

Then (/^i verify the errorcode for just checking (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	sleep (10)
	@@error_code_page.error_code_just_checking(file)
	assert_element_on_screen(arg)
	error_code
end

Then (/^i verify the errorcode for listing usuals (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	sleep (10)
	@@error_code_page.error_code_listing_usuals(file)
	assert_element_on_screen(arg)
	error_code
end

Then (/^i verify the errorcode for basket listing (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	sleep (10)
	@@error_code_page.error_code_list_basket(file)
	assert_element_on_screen(arg)
	error_code
end

Then (/^i verify the errorcode for list favourites (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	sleep (10)
	@@error_code_page.error_code_list_favourites(file)
	assert_element_on_screen(arg)
	error_code
end

Then (/^i verify the errorcode for chosen slot information (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	sleep (10)
	@@error_code_page.error_code_slot_info(file)
	assert_element_on_screen(arg)
	error_code
end

Then (/^i verify the errorcode for collection point address (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	sleep (10)
	@@error_code_page.error_code_collection_address(file)
	assert_element_on_screen(arg)
	error_code
end