require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'

class FavouriteHubPage < BasePage
	include Calabash::Android::Operations



	def trait
		"* id:'HeaderTitle' {text contains[c] 'favourites'}"
	end



	# def favourites
	#   tap "My favourites"
	#   wait_for_elements_do_not_exist ["* marked:'My favourites'"], timeout: 20
	# end

	def select_option_from_favorites(option)
		wait_for_elements_exist ["tescoui.customfontcomponents.RobotoTextView {text contains[c] '#{option}'}"]
		touch "tescoui.customfontcomponents.RobotoTextView {text contains[c] '#{option}'}"
	end



	def my_favourites
		sleep 3.0 # it takes awhile to load favourites even if the user has them.
		if !element_exists "* id:'fav_no_item'"
			select_option_from_favorites("My favourites")
		else
			raise "This user has not placed an order, so there is no 'My favourites' available"
		end
	end



	def my_usuals
		sleep 3.0 # it takes awhile to load usuals even if the user has them.
		if !element_exists "* id:'usuals_no_item'"
			select_option_from_favorites("My usuals")
		else
			raise "This user does not have at least 2 orders, so there is no 'My usuals' available"
		end
	end



	def my_recent_order
		if !element_exists "* id:'empty_ord_content_txt'"
			select_option_from_favorites("Order ")
		else
			raise "This user does not have a previous order"
		end
	end

end


