Then (/^I can empty my basket, if my basket is not empty$/) do
	if @@basket_page.basket_items_count > 0
		@@basket_page.empty_basket
		@@basket_page.confirm_empty_basket
	else
		"Basket already empty"
	end
end

Then (/^I can cancel my open orders, if I have open orders$/) do
	@@my_order_page.clear_all_orders
end