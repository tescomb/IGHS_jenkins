@sanity_final_ops @wip
Feature:Sanity

    @OPS_checkout
    Scenario:Checkout from API
	   Given i'm triggering the api to complete checkout for ops

    @sanity_fina_opsl @reinstall
    Scenario: Sanity test for Grocery Android
	   Given i'm on application landing page
	   When i login to the application from LHN if user is not logged in
	   And i open side nav and touch Book a Slot
	   And i wait for the view Home Delivery
	   And I wait for the view with id "LoadingProgress" to disappear
	   And I wait for the view with id "LoadingProgress" to disappear
	   Then I select Home Delivery from the book a slot page
	   And I wait for the view with id "LoadingProgress" to disappear
	   And I choose a date with available times
	   Then i should Book a Slot for home delivery is reserved with correct date
	   And I go back to previous screen
	   And i execute a search with Sugar
	   And i add item to basket
	   And i click on action_bar_up_navigation
	   And I wait for the view with id "LoadingProgress" to disappear
	   And i open side nav and touch Favourites & usuals
	   And I wait for the view with id "LoadingProgress" to disappear
	   Then i click on My favourites
	   And I wait for the view with id "LoadingProgress" to disappear
	   Then i wait for the view pro_title
	   And i add item to basket
	   And I go back to previous screen
	   And i open side nav and touch Browse all groceries
	   And i select category to shop
	   And i wait for the view pro_title
	   And i add item to basket
	   And I go back to previous screen
	   When i open side nav and touch Special Offers
	   And i tap on All Offers from special offers
	   And i wait for the view pro_title
	   And i add item to basket
	   Then I should see basket value changes
	   And I go to my basket
	   And i wait for the view Checkout
	   And I go back to previous screen
	   And I wait for 2 seconds
	   And I go back to previous screen
	   And I wait for 2 seconds
	   When i open side nav and touch Book a Slot
	   And i wait for the view Home Delivery
	   And I wait for the view with id "LoadingProgress" to disappear
	   And I wait for the view with id "LoadingProgress" to disappear
	   And I select click and collect from the book a slot page
	   And I wait for the view with id "LoadingProgress" to disappear
	   And i click on collection_point_address
	   And I wait for the view with id "LoadingProgress" to disappear
	   And I choose a date with available times
	   And I wait for the view with id "LoadingProgress" to disappear
	   Then i open side nav and touch My orders
	   And I wait for the view with id "LoadingProgress" to disappear
	   And I wait for the view with id "LoadingProgress" to disappear
	   And i click on Make Changes
	   And I wait for "Save changes" to appear
	   Then i execute a search with Sugar
	   And i add item to basket from PDP
	   Then I should see basket value changes
	   And i click on Save changes
	   And i click on Yes
	   Then I should not see "Save changes"
	   And i click on Continue
	   Then I should not see "Save changes"
	   And I wait for the view with id "LoadingProgress" to disappear
	   Then I should see text containing "Saved"








