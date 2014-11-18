require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class ShopPage < BasePage
	include Calabash::Android::Operations



	def trait
		"* marked:'HeaderTitle' {text contains[c] 'shop'}"
	end



	def select_category(category_name)
		query_string = "* {text contains[c] '#{category_name}'}"

		begin
			wait_for_elements_exist [query_string]
			touch query_string
		rescue
			touch query_string
		end
	end



	def close_pdp_screen
		wait_for_elements_exist [$cancel_PDP_screen], timeout: $wait_time
		touch($cancel_PDP_screen)
	end



	def Tap_pdp_screen
		wait_for_elements_exist [$cancel_PDP_screen], timeout: $wait_time
		touch($cancel_PDP_screen)
	end



	def sortby_screen
		wait_for_elements_exist [$sort_by_button], timeout: $wait_time
		touch($sort_by_button)
	end



	def apply_sort(apply_btn)
		wait_for_elements_exist [$apply_sort_button], timeout: $wait_time
		touch($apply_sort_button)
	end



	def tap_offer_screen
		wait_for_elements_exist [$special_offer_screen], timeout: $wait_time
		touch($special_offer_screen)
	end



	def plp_catchbyweight_pdp
		wait_for_elements_exist [$catch_by_weight_button], timeout: $wait_time
		touch($catch_by_weight_button)
		cbw = "* marked:'pro_catch_wt_price'"
		# @cbwproduct=(wait_for_elements_exist( ["* marked:'pro_catch_wt_price'"], :timeout => 30))
		if cbw
			sleep(2)
			touch("* marked:'popup_list_item'") # Tap first product
			sleep 2
		else
			raise "catch by weight product not in the list"
		end
	end



	def navigating_plp(arg)
		case arg

			when "Home"
				puts("Hi")

			when "Browse all groceries"
				@@shop_page.select_category('Fresh Food')
				@@shop_page.select_category('Fresh Fruit')
				@@shop_page.select_category('Dried Fruit & Nuts')

			when "My favourites"
				wait_for_none_animating
				wait_for_elements_exist ["* marked:'My favourites'"], timeout: 30
				touch("* marked:'My favourites'")
				wait_for_elements_do_not_exist ["* id:'LoadingProgress'"]

			when "My orders"
				wait_for_animate_3sec
				wait_for_elements_exist ["* id:'slot_method'"], timeout: 30
				touch("* id:'slot_method'")
				wait_for_animate_3sec
				wait_for_elements_exist ["* marked:'Sort by'"], timeout: 30

			when "Promotions"
				wait_for_animate_3sec
				wait_for_elements_exist ["* id:'menu_name'"], timeout: 30
				touch("* id:'menu_name'")
				wait_for_animate_3sec
		end
	end
end