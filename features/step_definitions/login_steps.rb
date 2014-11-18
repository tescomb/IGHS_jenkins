require File.dirname(__FILE__) + '/../../features/repo_id/ids'
When(/^i login to the application from LHN$/) do
	sleep 1.8

	if element_exists "* marked:'next_btn'"
		touch("* marked:'next_btn'")
		wait_for_elements_exist ["* marked:'next_btn'"], timeout: 2
		touch("* marked:'next_btn'")
	end

	if element_exists $update_cancel
		touch $update_cancel
	end
	open_side_nav
	if element_exists "* marked:'Sign out'"
		touch "* marked:'Sign out'"
		wait_for_elements_exist ["* marked:'ok_btn'"], timeout: $wait_time
		touch "* marked:'ok_btn'"
		wait_for_elements_exist [$lhn], timeout: $wait_time
		open_side_nav
	end
	@@login_from_lhn.choose_navigation('Sign in')
	wait_for_elements_exist [$username_field], timeout: $wait_time
	step "i enter valid credentials"

end


And(/^i enter valid credentials$/) do
	credentials=ENV['LOGIN'].split(':')
	enter_credentials(credentials[0], credentials[1])
	@@login_page.login
end

Then(/^i should be logged in$/) do
	@@home_page.await timeout: $wait_time
end

Given(/^i'm on application landing page$/) do
	sleep 0.5
	begin
		@@tour_page.await timeout: 5
		@@tour_page.take_tour
=begin
		if not query("* marked:'Not now'").empty?
			touch "* marked:'Not now'"
		end
=end
	rescue
=begin
		if not query("* marked:'Not now'").empty?
			touch "* marked:'Not now'"
		end
=end
	end
end

When /^i open side nav and touch (.*)$/ do |arg|
	sleep 1.2
=begin
	if not query("* marked:'Not now'").empty?
		touch "* marked:'Not now'"
	end
=end
	if arg == 'Basket'
		touch $basket_header
	else
		open_side_nav
		@@login_from_lhn.choose_navigation(arg)
		steps %Q{
         And I wait for the view with id "LoadingProgress" to disappear with loop 2
      }
	end
end

And(/^i navigate to PLP page (.*)$/) do |arg|
	@@shop_page.navigating_plp(arg)
end


Then(/^i should be prompted to login$/) do
	wait_for_elements_exist [$username_field], timeout: $wait_time
	login_present=query($username_field).any?
	assert_true(login_present, "Application didnt display Login Pop Up")
end

Given(/^i login to the application from LHN for a new user$/) do
	sleep 1.8
	if element_exists $update_cancel
		touch $update_cancel
	end
	open_side_nav
	if element_exists "* marked:'Sign out'"
		touch "* marked:'Sign out'"
		wait_for_elements_exist ["* marked:'ok_btn'"], timeout: $wait_time
		touch "* marked:'ok_btn'"
		wait_for_elements_exist [$lhn], timeout: $wait_time
		open_side_nav
	end
	@@login_from_lhn.choose_navigation('Sign in')
	wait_for_elements_exist [$username_field], timeout: $wait_time
	step "i enter valid credentials for a new user"
end

And(/^i enter valid credentials for a new user$/) do
	@@login_page.new_user_credential
	@@login_page.login
end

And(/^i enter username as (.*) and password as (.*) and submit$/) do |username, password|
	enter_credentials(username, password)
	@@login_page.login
end

When(/^i login to the application from LHN if user is not logged in$/) do
	sleep 1.8
	open_side_nav
	if element_exists "* marked:'Sign out'"
		'do nothing'
		close_side_nav
	else
		@@login_from_lhn.choose_navigation('Sign in')
		wait_for_elements_exist [$username_field], timeout: $wait_time
		step "i enter valid credentials"
		begin
			wait_for_elements_exist [$username_logged], timeout: $wait_time
		rescue
			open_side_nav
			touch "* marked:'Home'"
			wait_for_elements_exist [$username_logged], timeout: $wait_time
		end


	end
end

Given(/^I logout from the application if user is logged in$/) do
	steps %Q{
         And i logout from the application if user is logged in
      }
end

When(/^i logout from the application if user is logged in$/) do
	sleep 1.8
	open_side_nav
	if element_exists "* marked:'Sign out'"
		touch "* marked:'Sign out'"
		wait_for_elements_exist ["* marked:'ok_btn'"], timeout: $wait_time
		touch "* marked:'ok_btn'"
		wait_for_elements_exist [$lhn], timeout: $wait_time
		steps %Q{
         And I wait for the view with id "LoadingProgress" to disappear with loop 2
      }
	else
		close_side_nav
	end
end
