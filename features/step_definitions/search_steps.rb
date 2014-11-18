require File.dirname(__FILE__) + '/../../features/repo_id/ids'
When(/^search icon is clicked$/) do
	wait_for_elements_exist [$search_bar_header], timeout: $wait_time
	touch $search_bar_header
end


When /^i search for (.*)$/ do |item|
	sleep 0.5
	query($search_edit_bar, :setText => "")
	sleep 0.5
	query($search_edit_bar, :setText => "#{item}")
	#wait_for_elements_exist ["* id:'grid_textview'"], timeout:20
	performAction('send_key_enter')
	sleep 2
	if query("tescoui.customfontcomponents.RobotoTextView", :text).include? 'No products found'
		puts ''
	else
		begin
			wait_for_elements_exist ["* id:'pro_img'"], timeout: $wait_time
		rescue
			''
		end
	end
end


When /^i execute for predictive search (.*)$/ do |item|
	steps %Q{
	When search icon is clicked
	      }
	query($search_edit_bar, :setText => "")
	query($search_edit_bar, :setText => "#{item}")
	#wait_for_elements_exist ["* id:'grid_textview'"], timeout:20
end

When /^i execute a search with (.*)$/ do |item|
	steps %Q{
	When search icon is clicked
	When i search for #{item}
  And I wait for the view with id "LoadingProgress" to disappear with loop 2
	      }
end

Then(/^i should see search history$/) do
	wait_for_elements_exist ["* id:'grid_textview'"], timeout: $wait_time
	history_exists=element_exists "* id:'grid_textview'"
	assert_true(history_exists, 'Search History is not present')

end

Then(/^i should see the same results as per the api call$/) do
	@@product_name_expected=Array.new
	3.times do
		@@count||=0
		push_to_array=query("* id:'pro_title' index:#{@@count}", :text).first
		@@product_name_expected.push push_to_array
		@@count +=1
	end
	assert_two_arrays(@@httparty.product_list_name, @@product_name_expected)

end

Then(/^predictive results should hold (.*)/) do |arg|
	wait_for_elements_exist ["* id:'grid_textview'"], timeout: 30
	@@count=1
	3.times do
		@@count||=1
		a=query("* id:'grid_textview' index:#{@@count}", :text).first
		@@count+=1
		expected=a.downcase.include? arg.downcase
		assert_true(expected, 'Predective results didnt hold'+arg+'')
	end
end

Then (/^i should get No products message$/) do
	@@search_page.empty_products
	assert_true(@@search_page.no_products, "No products message is not displayed")
end

And(/^i want to clean the history$/) do
		@@search_page.clear_all_history
end

Then(/^i must see the scan option on the screen$/) do
	if ENV['PLATFORM'] == 'tablet'
		steps %Q{
	Then i must see the required text Scan
	      }
	elsif ENV['PLATFORM'] == 'phone'
		steps %Q{
	Then i must see the required text Scan it
	      }
	elsif ENV['PLATFORM'] == 'ighs'
		steps %Q{
	Then i must see the required text Scan it
	      }
	end
end

And(/^i want to click scan$/) do
	@@search_page.scan_it
end
