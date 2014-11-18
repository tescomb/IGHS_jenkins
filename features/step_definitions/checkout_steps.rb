Then (/^I start checkout process from basket$/) do
	@@checkout_page.basket_checkout_tab
	steps %Q{
							 And I wait for the view with id "LoadingProgress" to disappear with loop 2
	      }

	if element_exists "* marked:'Continue'"
		touch "* marked:'Continue'"
		steps %Q{
							 And I wait for the view with id "LoadingProgress" to disappear with loop 2
	      }
	end
end


Then (/^I tap continue on checkout from checking$/) do
	steps %Q{
							 And I wait for the view with id "LoadingProgress" to disappear with loop 2
	      }
	begin
		@@checkout_page.continue_checkout_tab
	rescue

	end

end


And (/^I enter password in checkout$/) do
	@@checkout_page.await timeout: $wait_time
	@@checkout_page.enter_password_tab
end


When (/^I signin to checkout$/) do
	@@checkout_page.proceed_checkout_tab
	sleep (5)
end

And (/^I navigate to checkout summary screen$/) do
	@@checkout_summary_page.await timeout: $wait_time
end

And (/I tap on proceed to payment$/) do
	@@checkout_summary_page.proceed_to_payment_tab
end

And (/^I navigate to payment screen$/) do
	@@payment_page.await timeout: $wait_time
end

When (/^I enter my credit card details$/) do
	@@payment_page.enter_payment_credentials_tab
end

And (/^I confirm payment$/) do
	@@payment_page.confirm_payment_tab
end

When (/^I see the order confirmation page$/) do
	@@checkout_confirmation_page.await timeout: $wait_time
end

And (/^I tap OK on the order confirmation page$/) do
	@@checkout_confirmation_page.tap_okay_tab
end


And(/^i complete my checkout process$/) do
	steps %Q{
	  And I enter password in checkout
    When  I signin to checkout
    And I navigate to checkout summary screen
    And I tap on proceed to payment
    And I navigate to payment screen
    When I enter my credit card details
    And I confirm payment
    When I see the order confirmation page
    And I tap OK on the order confirmation page
}
end

Then (/^I verify the Email Id button is prefilled$/) do
	@@credentials=ENV['LOGIN'].split(':')
	@@checkout_page.email_prefill
	assert_element_equal(@@credentials[0], @@checkout_page.prefilled_email)
end

Then (/^i get cancel confirmation dialog$/) do
	@@checkout_page.cancel_confirmation
	assert_true(@@checkout_page.checkout_confirmation, "Cancel Checkout dialog is not displayed")
end

When (/^I click on up navigation button$/) do
	wait_for_elements_exist(["* marked:'action_bar_up_navigation'"], timeout: $wait_time)
	touch ("* marked:'action_bar_up_navigation'")
end

When (/^i am in the checkout process$/) do
	steps %Q{
	  And I enter password in checkout
    When  I signin to checkout
    And I navigate to checkout summary screen
}
end

When (/^i give correct credentials$/) do
	steps %Q{
	  And I enter password in checkout
    When  I signin to checkout
}
end

And (/^i tap on forgot password link$/) do
	@@checkout_page.forget_password
end

When (/^I click checkout process from basket$/) do
	@@checkout_page.basket_checkout_tab
	if element_exists("* marked:'Just Checking'")
		puts ("Promostions are present  for the product")
	end

end