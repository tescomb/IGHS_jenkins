@wip @network
Feature: Handling No network validations

    Background:
	   Given i turn on the wifi network
	   And i'm on homepage

    @network_homepage
    Scenario: No Network banner should be displayed when the application is launched without data
	   When i turn off the wifi network
	   Then i must see the required text Network unavailable
	   And i turn on the wifi network
	   Then i must not see the required text "Network unavailable"

    @network_shopall
    Scenario: Network error should be displayed when user is shopping with category and the network drops
	   When i open side nav and touch Shop all groceries
	   And i turn off the wifi network
	   And i select category to shop
	   Then i must see the required text Sorry, we can't find a connection. Please check your network.

    @network_amend
    Scenario: To verify error message is displayed while making changes with no network in amend mode
	   Given i'm triggering the amend from api for sanity
	   And i login to the application from LHN
	   When i add item to basket
	   And I should see basket value changes
	   Then i turn off the wifi network
	   And i click on Make Changes
	   Then i must see the required text Network unavailable

    @network_shop_sort
    Scenario: To verify error message is displayed while filter by sort is selected when network is dropped
	   When i open side nav and touch Shop all groceries
	   And i select category to shop
	   And i click on Sort by
	   When i turn off the wifi network
	   And i click on A - Z
	   And i click on Apply
	   Then i must see the required text Sorry, we can't find a connection. Please check your network.

    @network_shop_add_item
    Scenario: To verify error message is displayed when add item is triggred when network is dropped
	   When i login to the application from LHN
	   And i open side nav and touch Shop all groceries
	   And i select category to shop
	   And i add item to basket
	   When i turn off the wifi network
	   And i add item to basket in anonymous mode
	   Then i must see the required text Sorry, we can't find a connection. Please check your network.
	   And i click on OK
	   When I remove an item
	   Then i must see the required text Sorry, we can't find a connection. Please check your network.

    @network_search
    Scenario: To verify error message is displayed when search is executed and network drops
	   When i turn off the wifi network
	   And i execute a search with Sugar
	   Then i must see the required text Sorry, we can't find a connection. Please check your network.

    @network_basket
    Scenario: To verify error message is displayed when basket is selected and network drops
	   When i login to the application from LHN
	   And i execute a search with Sugar
	   And i add item to basket
	   When i turn off the wifi network
	   Then i select the basket
	   And i must see the required text Network unavailable

    @network_basket_add_item
    Scenario: To verify error message is displayed when basket is selected and network drops
	   When i login to the application from LHN
	   And i execute a search with Sugar
	   And i add item to basket
	   When i select the basket
	   And i turn off the wifi network
	   And i click on Network unavailable
	   And i add item to basket in anonymous mode
	   Then i must see the required text Sorry, we can't find a connection. Please check your network.
	   And i click on Ok
	   Then i must not see the required text "Sorry, we can't find a connection. Please check your network."

    @network_basket_empty
    Scenario: To verify error message is displayed when basket is selected and network drops
	   When i login to the application from LHN
	   And i execute a search with Sugar
	   And i add item to basket
	   When i select the basket
	   And i turn off the wifi network
	   And i click on Network unavailable
	   And i click on Empty basket
	   Then i click on Empty
	   Then i must see the required text Sorry, we can't find a connection. Please check your network.
	   And i click on Ok
	   Then i must not see the required text "Sorry, we can't find a connection. Please check your network."

    @network_book_a_slot
    Scenario: To verify error message is displayed when change slot is clicked and network drops
	   When i'm setting the prerequisite for checkout
	   And i login to the application from LHN
	   And i select the basket
	   And i turn off the wifi network
	   Then i must see the required text Sorry,unable to retrieve slot
	   And i turn on the wifi network
	   Then i must not see the required text "Sorry,unable to retrieve slot"

    @network_favourites @reinstall
    Scenario: To verify if error message is displayed when clicked on VIEW ALL from dashboard when network is dropped and once the network is back, the fav page should load
	   When i login to the application from LHN
	   And i wait for the view pro_title
	   And i turn off the wifi network
	   And i click on Network unavailable
	   And i open side nav and touch Favourites
	   Then i must see the required text Sorry, we can't find a connection. Please check your network.
	   And i click on OK
	   And i turn on the wifi network
	   When i click on Try Again
	   Then i wait for the view pro_title

    @network_justchecking
    Scenario: To verify if error message is displayed when clicked on Just checking continue button when network drops
	   When i'm setting the prerequisite for checkout
	   And i login to the application from LHN
	   And i wait for the view pro_title
	   And i add item to basket
	   When i select the basket
	   And i click on check_out_btn
	   And i turn off the wifi network
	   Then i wait for the view Continue to checkout
	   And i click on Continue to checkout
	   Then i must see the required text Sorry, we can't find a connection. Please check your network.
	   And i click on OK
	   Then i turn on the wifi network
	   And i must not see the required text "Sorry,unable to retrieve slot"

    @network_login @reinstall
    Scenario: To verify if error message is displayed when clicked on Sign in and when network drops
	   When i turn off the wifi network
	   And i click on Network unavailable
	   And i login to the application from LHN
	   Then i must see the required text Sorry, we can't find a connection. Please check your network.



