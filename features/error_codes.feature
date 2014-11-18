@wip
Feature: Error code test

    @error @reset
    Scenario Outline: Error code handling for search
	   Given i'm on homepage
	   When I perform a search for error code
	   Then verify the error <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                 | file       | error_code |
	   | No products found                                                   | search_600 | 600        |
	   | Sorry, we cannot find the product you are looking for.              | search_800 | 800        |
	   | Sorry, we could not find any products because our servers are busy. | search_900 | 900        |
	   | Sorry, we could not find any products because our servers are busy. | search_910 | 910        |
	   | Sorry, we could not find any products because our servers are busy. | search_390 | 390        |

    @special @reset
    Scenario Outline: Error code handling for ListSpecialOffers
	   Given i'm on homepage
	   When i click on VIEW ALL
	   Then verify the errorcode for special offers <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                            | file              | error_code |
	   | No products in this section                                                    | specialoffers_600 | 600        |
	   | Request processed successfully                                                 | specialoffers_800 | 800        |
	   | Sorry, we are experiencing lots of traffic and we can't connect you right now. | specialoffers_900 | 900        |
	   | Sorry, we are experiencing lots of traffic and we can't connect you right now. | specialoffers_910 | 910        |
	   | Sorry, we are experiencing lots of traffic and we can't connect you right now. | specialoffers_390 | 390        |

    @reinstall @shoperror
    Scenario Outline: Error code handling for shop
	   Given i'm on homepage
	   And i open side nav and touch Shop all groceries
	   When i select category to shop
	   Then verify the errorcode for shop <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                            | file     | error_code |
	   | Sorry, there was an unexpected error.                                          | shop_800 | 800        |
	   | Sorry, we are experiencing lots of traffic and we can't connect you right now. | shop_900 | 900        |

    @listdelivery
    Scenario Outline: Error handling in book a slot screen when ListDeliveryslot API call is activated on tapping home delivery
	   Given i'm on homepage
	   And i login to the application from LHN
	   When i open side nav and touch Book a Slot
	   And I select Home Delivery from the book a slot page
	   Then i verify the errorcode for list delivery slot <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                           | file       | error_code |
	   | Sorry, we could not retrieve the delivery slots because our servers are busy. | LDSlot_900 | 900        |
	   | Sorry, we could not retrieve the delivery slots because our servers are busy. | LDSlot_910 | 910        |
	   | Sorry, we could not retrieve the delivery slots because our servers are busy. | LDSlot_800 | 800        |

    @listcollectionpoints @reset
    Scenario Outline: Error handling in book a slot screen when listcollectionpoints API call is activated on tapping Click and collect
	   Given i'm on homepage
	   And i login to the application from LHN
	   When i open side nav and touch Book a Slot
	   And i wait for the view timeslotTv
	   And I select Click and Collect from the book a slot page
	   Then i verify the errorcode for list collection point <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                                          | file      | error_code |
	   | Sorry, there was an unexpected error.                                                        | LCPts_600 | 600        |
	   | No Collection Points Found - Please try entering another postcode or choose another address. | LCPts_800 | 800        |
	   | Sorry, we could not your nearest collection points because our servers are busy.             | LCPts_900 | 900        |
	   | Sorry, we could not your nearest collection points because our servers are busy.             | LCPts_910 | 910        |
	   | Sorry, we could not your nearest collection points because our servers are busy.             | LCPts_180 | 180        |
	   | Sorry, you can't make this change to a pending order.                                        | LCPts_500 | 500        |

    @listcollectionslots
    Scenario Outline: Error handling in book a slot screen when listcollectionslots API call is activated on tapping a address from Click and collect
	   Given i'm on homepage
	   And i login to the application from LHN
	   When i open side nav and touch Book a Slot
	   And i wait for the view timeslotTv
	   And i select Click and Collect and choose the nearest location
	   Then i verify the errorcode for list collection slot <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                             | file        | error_code |
	   | Sorry, there was a problem retrieving collection slots. Please try again later. | LCSlots_800 | 800        |
	   | Sorry, we could not retrieve the collection slots because our servers are busy. | LCSlots_900 | 900        |
	   | Sorry, we could not retrieve the collection slots because our servers are busy. | LCSlots_910 | 910        |
	   | Sorry, we could not retrieve the collection slots because our servers are busy. | LCSlots_370 | 370        |


    @emptybasket
    Scenario Outline: Error handling in basket screen when emptybasket is activated
	   Given i'm triggering add item api
	   When i'm on homepage
	   And i login to the application from LHN
	   And I go to my basket
	   When I tap on the empty basket button
	   And i click on Empty
	   Then i verify the errorcode for empty basket <arg> with status code from <file> as <error_code>

    Examples:
	   | arg                                                                         | file            | error_code |
	   | Sorry, we could not add or remove the product because our servers are busy. | EmptyBasket_900 | 900        |
	   | Sorry, we could not add or remove the product because our servers are busy. | EmptyBasket_910 | 910        |
	   | Sorry, we could not add or remove the product because our servers are busy. | EmptyBasket_800 | 800        |

    @changebasket
    Scenario Outline: Error handling in adding item to basket when changebasket is activated
	   Given i'm triggering a empty basket api
	   When i'm on homepage
	   And i login to the application from LHN
	   When i add item into basket
	   Then i verify the errorcode for change basket <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                                                                     | file        | error_code |
	   | Please sign in to make use of this feature                                                                              | CBasket_400 | 400        |
	   | Sorry, we could not add all those products to you basket. Please check your basket to verify which products were added. | CBasket_800 | 800        |
	   | Sorry, we could not add or remove the product because our servers are busy.                                             | CBasket_900 | 900        |
	   | Sorry, we could not add or remove the product because our servers are busy.                                             | CBasket_910 | 910        |
	   | Sorry, we could not add or remove the product because our servers are busy.                                             | CBasket_170 | 170        |

    @choosedeliveryslot @reset
    Scenario Outline: Error handling in booking a slot from home delivery when CHOOSEDELIVERYSLOT is activated.
	   Given i'm triggering clean api for book a slot
	   And i'm on homepage
	   And i login to the application from LHN
	   When i open side nav and touch Book a Slot
	   And I select Home Delivery from the book a slot page
	   When i select a slot
	   Then i verify the errorcode for choose delivery slot <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                                      | file       | error_code |
	   | Sorry, that slot is now fully booked. Please choose another slot or try Click & Collect. | CDSlot_800 | 800        |
	   | Sorry, we are experiencing lots of traffic and we could not book that slot right now.    | CDSlot_900 | 900        |
	   | Sorry, we are experiencing lots of traffic and we could not book that slot right now.    | CDSlot_910 | 910        |
	   | Sorry, we are experiencing lots of traffic and we could not book that slot right now.    | CDSlot_310 | 310        |

    @choosecollectionslot
    Scenario Outline: Error handling in booking a slot from click and collect when CHOOSECOLLECTIONSLOT is activated.
	   Given i'm triggering clean api for book a slot
	   And i'm on homepage
	   And i login to the application from LHN
	   When i open side nav and touch Book a Slot
	   And i wait for the view timeslotTv
	   And i select Click and Collect and choose the nearest location
	   When i select a slot
	   Then i verify the errorcode for choose collection slot <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                                    | file       | error_code |
	   | Sorry, that slot is now fully booked. Please choose another slot or try Home Delivery. | CCSlot_800 | 800        |
	   | Sorry, we could not book that slot because our servers are busy.                       | CCSlot_900 | 900        |
	   | Sorry, we could not book that slot because our servers are busy.                       | CCSlot_910 | 910        |
	   | Sorry, we could not book that slot because our servers are busy.                       | CCSlot_320 | 320        |

    @readyforcheckout
    Scenario Outline: Error handling on tapping on continue to checkout when READYFORCHECKOUT is activated
	   Given i'm triggering add item api
	   And i'm on homepage
	   And i login to the application from LHN
	   And I go to my basket
	   When I start checkout process from basket
	   Then i verify the errorcode for initiating a checkout <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                            | file           | error_code |
	   | Book a slot                                                                    | RFCheckout_280 | 280        |
	   | No items to checkout                                                           | RFCheckout_800 | 800        |
	   | Sorry, we are experiencing lots of traffic and we can't connect you right now. | RFCheckout_900 | 900        |
	   | Sorry, we are experiencing lots of traffic and we can't connect you right now. | RFCheckout_910 | 910        |
	   | Sorry, we are experiencing lots of traffic and we can't connect you right now. | RFCheckout_270 | 270        |

    @justcheckingerror
    Scenario Outline: Error handling for just checking screen when JUSTCHECKING is activated
	   Given i'm triggering the api for just checking
	   And i'm on homepage
	   And i login to the application from LHN
	   And I go to my basket
	   When I start checkout process from basket
	   Then i verify the errorcode for just checking <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                                                        | file          | error_code |
	   | Sorry, we could not checkout your order. Please make sure you have items in your basket and a slot booked. | JChecking_600 | 600        |
	   | Sorry, there was an unexpected error.                                                                      | JChecking_800 | 800        |
	   | Sorry, we are experiencing lots of traffic and we can't connect you right now.                             | JChecking_900 | 900        |
	   | Sorry, we are experiencing lots of traffic and we can't connect you right now.                             | JChecking_910 | 910        |
	   | Sorry, we are experiencing lots of traffic and we can't connect you right now.                             | JChecking_470 | 470        |

    @listusuals @workinprogress
    Scenario Outline: Error handling for usuals when LISTUSUALS is activated
	   Given i'm triggering the api for just checking
	   And i'm on homepage
	   And i login to the application from LHN
	   When i open side nav and touch Favourites & usuals
	   And i touch on my usuals
	   Then i verify the errorcode for listing usuals <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                    | file        | error_code |
	   | Your usuals will be displayed here after your second order             | LUsuals_600 | 800        |
	   | Request processed sucessfully                                          | LUsuals_800 | 900        |
	   | Sorry, we could not retrieve your usuals because our servers are busy. | LUsuals_900 | 910        |
	   | Sorry, we could not retrieve your usuals because our servers are busy. | LUsuals_910 | 390        |
	   | Sorry, we could not retrieve your usuals because our servers are busy. | LUsuals_390 | 600        |

    @listbasket @reset
    Scenario Outline: Error handing for list basket when LISTBASKET is activated
	   Given i'm on homepage
	   And i login to the application from LHN
	   When I go to my basket
	   Then i verify the errorcode for basket listing <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                         | file        | error_code |
	   | Sorry, we could not add or remove the product because our servers are busy. | LBasket_900 | 900        |
	   | Sorry, we could not add or remove the product because our servers are busy. | LBasket_910 | 910        |
	   | Sorry, we could not add or remove the product because our servers are busy. | LBasket_800 | 800        |

    @listfavourites
    Scenario Outline: Error handling for list basket summary when LISTFAVOURITES is activated
	   Given i'm on homepage
	   And i login to the application from LHN
	   And i login to the application from LHN
	   When i open side nav and touch Favourites & usuals
	   Then i verify the errorcode for list favourites <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                        | file            | error_code |
	   | Your favourites will be displayed here after your first order              | LFavourites_600 | 600        |
	   | Request processed sucessfully.                                             | LFavourites_800 | 800        |
	   | Sorry, we could not retrieve your favourites because our servers are busy. | LFavourites_900 | 900        |
	   | Sorry, we could not retrieve your favourites because our servers are busy. | LFavourites_910 | 910        |
	   | Sorry, we could not retrieve your favourites because our servers are busy. | LFavourites_390 | 390        |

    @getchosenslotinfo
    Scenario Outline: Error handling for get chosen slot information when GETCHOSENSLOTINFO is activated
	   Given i'm triggering clean api for book a slot
	   And i'm on homepage
	   And i login to the application from LHN
	   When i open side nav and touch Book a Slot
	   Then i verify the errorcode for chosen slot information <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                       | file       | error_code |
	   | Sorry, we could not retrieve your slot info because our servers are busy. | GCslot_900 | 900        |
	   | Sorry, we could not retrieve your slot info because our servers are busy. | GCslot_910 | 910        |
	   | Sorry, we could not retrieve your slot info because our servers are busy. | GCslot_800 | 800        |

    @getcollectionpointaddress
    Scenario Outline: Error handling for get collection point infoformation when GETCOLLECTIONPOINTADDRESS is activated
	   Given i'm triggering clean api for book a slot
	   And i'm on homepage
	   And i login to the application from LHN
	   When i open side nav and touch Book a Slot
	   And i wait for the view timeslotTv
	   And i select Click and Collect and choose the nearest location
	   Then i verify the errorcode for collection point address <arg> with status code from <file> as <error_code>
    Examples:
	   | arg                                                                                          | file          | error_code |
	   | Sorry, you can't make this change to a pending order.                                        | GCAddress_460 | 460        |
	   | Sorry, we can't find the address for that collection point.                                  | GCAddress_800 | 800        |
	   | Sorry, we could not find the address for that collection point because our servers are busy. | GCAddress_900 | 900        |
	   | Sorry, we could not find the address for that collection point because our servers are busy. | GCAddress_910 | 910        |
	   | Sorry, we could not find the address for that collection point because our servers are busy. | GCAddress_180 | 180        |
