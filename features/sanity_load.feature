@sanity_load
Feature:Sanity

    @reinstall
    Scenario:clean API
	   Given i'm triggering the api for the shop checkout

    @reinstall
    Scenario: Book a slot Home Delivery
	   Given i'm on application landing page
	   And i login to the application from LHN if user is not logged in
	   When i open side nav and touch Book a Slot
	   And I wait for the view with id "LoadingProgress" to disappear with loop 4
	   And I select Home Delivery from the book a slot page
	   And I choose a date with available times
	   Then i should Book a Slot for home delivery is reserved with correct date

    @reinstall
    Scenario: As a user i must be able to add item to basket from basket screen
	   Given i'm on application landing page
	   And i login to the application from LHN if user is not logged in
	   And i open side nav and touch Browse all groceries
	   When I go to my basket
	   And i add item to basket
	   Then I should see basket value changes

    @reinstall
    Scenario: As a user i must be able to add item to basket from favourites
	   Given i'm on application landing page
	   And i login to the application from LHN if user is not logged in
	   When i open side nav and touch Favourites & usuals
	   And I wait for the view with id "LoadingProgress" to disappear with loop 4
	   Then i click on My favourites
	   And I wait for the view with id "LoadingProgress" to disappear with loop 3
	   And i add item into basket
	   Then I should see basket value changes

    @reinstall
    Scenario: As a user i must be able to add item to basket from search
	   Given i'm on application landing page
	   When i login to the application from LHN if user is not logged in
	   And i execute a search with Sugar
	   And i add item to basket
	   Then I should see basket value changes

    @reinstall
    Scenario: As a user i must be able to add item to basket from shop
	   Given i'm on application landing page
	   When i login to the application from LHN if user is not logged in
	   And i open side nav and touch Browse all groceries
	   And i select category to shop
	   And i add item to basket
	   Then I should see basket value changes

    @reinstall
    Scenario: Book a slot Click and Collect
	   Given i'm triggering the api for the shop checkout
	   And i'm on application landing page
	   And i login to the application from LHN
	   When i open side nav and touch Book a Slot
	   And i select Click and Collect and choose the nearest location
	   And I choose a date with available times
	   Then i should Book a Slot for click and collect is reserved with correct date

    @testingcloud @reinstall
    Scenario: Anonymous Search
	   Given i'm on application landing page
	   And i logout from the application if user is logged in
	   When i execute a search with Sugar
	   Then i wait for the view pro_title
    @reinstall
    Scenario: Anonymous Shop
	   Given i'm on application landing page
	   And i logout from the application if user is logged in
	   When i open side nav and touch Browse all groceries
	   And i select category to shop
	   Then i wait for the view pro_title


    @test @reinstall
    Scenario: As a user i must be able to add item to basket from Special Offers
	   Given i'm on application landing page
	   And i login to the application from LHN if user is not logged in
	   When i open side nav and touch Special Offers
	   And i click on All Offers
	   And i add item to basket
	   Then I should see basket value changes

    @reinstall
    Scenario: As a user i must be able to amend an order and add item to basket from Home Delivery
	   Given i'm triggering the api for the shop checkout
	   And i'm on application landing page
	   When i login to the application from LHN if user is not logged in
	   And i open side nav and touch Book a Slot
	   And i wait for the view Home Delivery
	   And I wait for the view with id "LoadingProgress" to disappear with loop 3
	   And I wait for the view with id "LoadingProgress" to disappear with loop 3
	   Then I select Home Delivery from the book a slot page
	   And I wait for the view with id "LoadingProgress" to disappear with loop 3
	   And I choose a date with available times
	   Then i should Book a Slot for home delivery is reserved with correct date
	   Then i open side nav and touch My orders
	   And I wait for the view with id "LoadingProgress" to disappear with loop 3
	   And I wait for the view with id "LoadingProgress" to disappear with loop 3
	   And i click on Make Changes
	   And I wait for "Save changes" to appear
	   When i execute a search with Noodles
	   And i add item to basket
	   Then I should see basket value changes

    @reinstall
    Scenario: As a user i want to change slot for Home delivery in amend mode
	   Given i'm on application landing page
	   And i login to the application from LHN if user is not logged in
	   When i open side nav and touch Book a Slot
	   And I choose a date with available times
	   And I save changes to the amend order
	   Then I should not see "Make changes"





