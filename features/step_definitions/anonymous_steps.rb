Then(/^I remove the existing Clubcard if user already added$/) do
	@@anonumous_page.chk_Status
end

Then(/^I enter Clubcard details$/) do
	@@anonumous_page.enter_details
	@@anonumous_page.add_clubcard
end

Then(/^I see the Clubcard confirmation$/) do
	@@anonumous_page.closeclubcard
end

Then(/^I tap on Sort by from PLP page$/) do
	@@shop_page.sortby_screen
end

Then(/^i should tap on the seasonal buylist$/) do
	@@anonumous_page.closeclubcard
end

