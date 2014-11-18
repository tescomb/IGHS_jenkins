require 'calabash-android/calabash_steps'
require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'

Given(/^i'm on homepage$/) do
	sleep 5
	if element_exists "* marked:'try_again_B'"
		touch "* marked:'try_again_B'"
	end
	wait_for_elements_exist ["* marked:'Sign in'" && "* marked:'pro_title'"], timeout: $wait_time
end


When(/^I perform a search for error code$/) do
	touch "* id:'search_action_bar'"
	wait_for_elements_exist ["* id:'SearchEditText' "], timeout: $wait_time
	query("* id:'SearchEditText' ", :setText => "sugar")
	wait_for_elements_exist ["* id:'grid_textview'"], timeout: $wait_time
	touch("* id:'grid_textview'")
end


Then(/^verify the error (.*?) with status code from (.*?) as (.*?)$/) do |message, file, error_code|
	#count = Dir.entries('/Users/saikrishna/Grocery_vso_git/Grocery_old/api_sprint_automation/error_codes').size - 2
	#puts count
	#puts File.expand_path(File.join(File.dirname(__FILE__), "test_data.txt")
	error_code_search(file)
	wait_for_elements_exist ["* marked:'#{message}'"], timeout: 20
	expected=query("tescoui.customfontcomponents.RobotoTextView", "text")
	bool_exp=expected.include? message
	assert_true(bool_exp, 'Didnt see the required error validation'+message+'')
	error_code
end



def error_code_search(file)
	project_path=File.expand_path("../../../", __FILE__)
	path= project_path + "/test_data/search/test_data.txt"
	dest=File.open(path, "w+")
	##writing new data to the file test_data.txt
	source=File.open(project_path+'/error_codes/search/'+file+'.txt')
	IO.copy_stream(source, dest)
	puts IO.read(path)
end



Then(/^I go back to previous screen$/) do
	performAction('go_back')
	sleep 0.5
end


Then(/^i click on (.*)$/) do |arg|
	sleep 0.8
	if element_exists $update_cancel
		touch $update_cancel
	end
	wait_for_elements_exist ["* marked:'#{arg}'"], timeout: $wait_time
	find_state = query("* marked:'#{arg}'", :isEnabled).first
	if find_state == true
		touch("* marked:'#{arg}'")
		steps %Q{
         And I wait for the view with id "LoadingProgress" to disappear with loop 2
      }
	else
		pending "'#{arg}' is not enabled"
	end
end

Then /^i must see the required text (.*)$/ do |arg|
	assert_element_on_screen(arg)
end

Then /^i must not see the required text "([^\"]*)"$/ do |text|
	escape_special_char=text.gsub("'", "")
	mark = escape_quotes(text)
	wait_for_elements_do_not_exist ["* marked:'#{mark}'", 'Element'+text+'is still displayed on the screen'], timeout: $wait_time, timeout_message: 'Element '+ mark +' is still present on the scrren'
	performAction('assert_text', text, false) #second param indicated that the text should _not_ be found
end

And(/^i turn off the wifi network$/) do
	performAction('status_wifi', 'disable')
	sleep 3
end

And(/^i turn on the wifi network$/) do
	performAction('status_wifi', 'enable')
end

Then(/^i say (.*) for allo$/) do |arg|
	pending
end

Then(/^verify the errorcode for special offers (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	wait_for_elements_exist ["* marked:'#{arg}'"], timeout: $wait_time
	expected=query("tescoui.customfontcomponents.RobotoTextView", "text")
	bool_exp=expected.include? arg
	error_code_specialoffers(file)
	assert_true(bool_exp, 'Didnt see the required error validation'+arg+'')
	error_code



	def error_code_specialoffers(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + "/test_data/specialoffers/test_data.txt"
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/specialoffers/'+file+'.txt')
		IO.copy_stream(source, dest)
	end
end

Then(/^verify the errorcode for shop (.*) with status code from (.*) as (.*)$/) do |arg, file, error_code|
	wait_for_elements_exist ["* marked:'#{arg}'"], timeout: $wait_time
	expected=query("tescoui.customfontcomponents.RobotoTextView", "text")
	bool_exp=expected.include? arg
	error_code_shop(file)
	assert_true(bool_exp, 'Didnt see the required error validation'+arg)
	error_code
end

Then /^I wait for the view with id "([^\"]*)" to disappear$/ do |text|
	wait_for_elements_do_not_exist ["* id:'#{text}'"], timeout: $wait_time
end

Then /^I wait for the view with id "([^\"]*)" to disappear with loop (.*)$/ do |text, loop|
	loop.to_i.times do
		wait_for_elements_do_not_exist ["* id:'#{text}'"], timeout: $wait_time
	end
end



def error_code_shop(file)
	project_path=File.expand_path("../../../", __FILE__)
	path= project_path + '/test_data/shop/test_data.txt'
	dest=File.open(path, "w+")
	##writing new data to the file test_data.txt
	source=File.open(project_path+'/error_codes/shop/'+file+'.txt')
	IO.copy_stream(source, dest)
end



And(/^I scroll down until element (.*) is enabled$/) do |arg|
	until query("* id:'#{arg}'", :isEnabled).first
		performAction('drag', 50, 50, 50, 20, 10)
	end
end

And(/^I scroll down the application$/) do
	sleep 1
	performAction('drag', 50, 50, 50, 20, 10)
	@@count||=0
	until query("* id:'pro_title'", :isEnabled).first
		performAction('drag', 50, 50, 50, 20, 10)
		@@count+=1
		break while @@count == 5
	end
end

Then(/^I do not see the "([^\"]*)"$/) do |test|
	#assert_not_equal(expected, actual, failure_message = nil)
	assert(test, failure_message = "validation failed")
end


Then(/^I must see basket header text page$/) do
	#if element_on_screen == "Book a Slot" || element_on_screen =="Book a slot"
	if ENV['PLATFORM'] == 'tablet'
		assert_element_on_screen(Your shopping basket)
	elsif ENV['PLATFORM'] == 'phone'
		assert_element_on_screen(Basket)
	elsif ENV['PLATFORM'] == 'ighs'
		assert_element_on_screen(Basket)
	end
	#end

	Then(/^I must see page header text (.*)$/) do |arg|
		assert_element_on_screen(arg)
	end

end