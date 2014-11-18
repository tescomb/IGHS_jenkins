And(/^i navigate to buy list page from dashboard$/) do
  @@buy_list_page.buylist_banner
end

And(/^I navigate to the seasonal buy list page from LHN$/) do
  @@buy_list_page.buylist_nav_LHN
end

Then /^I verify the buylist categories$/ do
  @@buy_list_page.verify_categories
end

