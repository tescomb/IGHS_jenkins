require 'calabash-android/calabash_steps'
require 'calabash-android/abase'

And (/^i should get (.*) selected$/) do |arg|
	wait_for_elements_exist ["* marked:'#{arg}'"], timeout: $wait_time
	@@special_offers_page.offers_selection(arg)
	assert_true(@@special_offers_page.selection_state, "The '#{arg}' option is not selected on tapping on it")
end

And (/^i tap on (.*) from special offers$/) do |arg|
	@@special_offers_page.tapping_offers(arg)
end

When (/^i tap on offer description link$/) do
	@@special_offers_page.offer_description_link
end

Then (/^i should get offers screen$/) do
	@@special_offers_page.offer_screen_header
	assert_element_equal("Offer", @@special_offers_page.offer_header_text)
end

And (/^i should get offer and validity$/) do
	@@special_offers_page.offer_validity
	assert_element_equal(@@special_offers_page.offer_validity_main, @@special_offers_page.offer_validity_offer)
end

Then (/^i verify the special offers tab is disabled$/) do
	@@special_offers_page.special_offers_disabled
	assert_true(!@@special_offers_page.enabled_state, "The Special Offers tab is enabled unexpectedly")
end