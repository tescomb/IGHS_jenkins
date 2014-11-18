require 'calabash-android/cucumber'
Dir[File.dirname(__FILE__) + '/../../features/page/*.rb'].each do |file|
	require file
end
require File.dirname(__FILE__) + '/../../api/api_wrappers'
BEGIN { $VERBOSE = nil }

@@home_page||=HomePage.new
@@tour_page||=TourPage.new
@@logged_out_homepage||=LoggedOutHomePage.new
@@login_from_lhn||=LeftHandNavigationPage.new
@@login_page||=LoginPage.new
@@shop_page||=ShopPage.new
@@basket_page||=BasketPage.new
@@book_a_slot_page||=BookASlotPage.new
@@choose_a_slot_page||=ChooseASlotPage.new
@@slot_reserved_page||=SlotReservedPage.new
@@my_order_page||=MyOrdersPage.new
@@checkout_page||=CheckoutPage.new
@@checkout_summary_page||=CheckoutSummary.new
@@payment_page||=Payment.new
@@checkout_confirmation_page||=CheckoutConfirmation.new
@@httparty||=Partay.new
@@amend_page||=AmendPage.new
@@logout_page||=LogoutPage.new
@@favourites_page||=FavouritesPage.new
@@justchecking_page||=JustChecking.new
@@buy_list_page||=BuyList.new
@@anonumous_page||=AnonymousPage.new
@@special_offers_page||=SpecialOffersPage.new
@@dashboard_page||=DashboardPage.new
@@search_page||=SearchPage.new
@@error_code_page||=ErrorCodePage.new
