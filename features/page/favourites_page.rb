require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
require 'calabash-android/abase'

class FavouritesPage < BasePage
	include Calabash::Android::Operations

	attr_accessor :fav_status, :fav_tab, :rec_order_tapped, :rec__order_message, :message_scroll_off, :fav_not_available, :usual_not_available, :rec_not_available, :usual_selected, :fav_count, :all_count_num, :us_count



	def fav_selected(fav_status)
		self.fav_status=fav_status
	end



	def fav_enabled(fav_tab)
		self.fav_tab = fav_tab
	end



	def recent_order_tapped_state(rec_order_tapped)
		self.rec_order_tapped = rec_order_tapped
	end



	def recent_order_message(rec__order_message)
		self.rec__order_message=rec__order_message
	end



	def recent_order_scroll_off(message_scroll_off)
		self.message_scroll_off=message_scroll_off
	end



	def favourite_not_available(fav_not_available)
		self.fav_not_available=fav_not_available
	end



	def usuals_not_availble(usual_not_available)
		self.usual_not_available=usual_not_available
	end



	def recent_not_available(rec_not_available)
		self.rec_not_available=rec_not_available
	end



	def my_usual_selected_state(usual_selected)
		self.usual_selected=usual_selected
	end



	def favourite_count(fav_count)
		self.fav_count=fav_count
	end



	def all_count_number(all_count_num)
		self.all_count_num=all_count_num
	end



	def usual_count(us_count)
		self.us_count=us_count
	end



	def trait
		"* id:'HeaderTitle' {text contains[c] 'favourites'}"
	end



	def select_favourite_default
		favourite_default_value = query($favourite_option, :isSelected).first
		self.fav_selected(favourite_default_value)
	end



	def favourite_tab_disabled
		favourite_tab_state = query($favourite_tab, "enabled").first
		puts favourite_tab_state
		self.fav_enabled(favourite_tab_state)
	end



	def validatemessage
		wait_for_elements_exist([$price_message], :timeout => $wait_time)
		message_availability = element_exists($price_message)
		self.recent_order_message(message_availability)
	end



	def recent_order
		begin
			wait_for_elements_exist [$recent_order], timeout: $wait_time
			touch ($recent_order)
			recent_order_tapped=query($recent_order, :isSelected).first
			self.recent_order_tapped_state(recent_order_tapped)
		rescue
			fail "There are no Recent orders"
		end

	end



	def no_favourites
		wait_for_elements_exist([$favourite_option], :timeout => $wait_time)
		touch ($favourite_option)
		favourite_items=element_does_not_exist($product_general)
		self.favourite_not_available(favourite_items)
	end



	def no_usuals
		wait_for_elements_exist([$my_usual_option], :timeout => $wait_time)
		touch ($my_usual_option)
		usual_items=element_does_not_exist($product_general)
		self.usuals_not_availble(usual_items)
	end



	def no_recent_order
		wait_for_elements_exist([$favourite_option], :timeout => $wait_time)
		recent_orders=element_does_not_exist($recent_order)
		self.recent_not_available(recent_orders)
	end



	def my_usual
		wait_for_elements_exist([$my_usual_option], :timeout => $wait_time)
		touch ($my_usual_option)
		wait_for_animate_3sec
	end



	def my_usual_selected
		my_usual_selected=query($my_usual_option, :isSelected).first
		self.my_usual_selected_state(my_usual_selected)
	end



	def my_favourites
		wait_for_elements_exist([$favourite_option], :timeout => $wait_time)
		touch ($favourite_option)
	end



	def count_favourites
		fav_option_string=query("* id:'fav_desc'", "text").first
		fav_option_count=fav_option_string.scan(/\d/).join('')
		self.favourite_count(fav_option_count)
	end

	def favourites_count
		wait_for_elements_exist [$favourites_count], timeout: $wait_time
		fav_count=query("* id:'favourites_count'",:text).first
		puts "Favourites count is:#{fav_count}"
	end

	def usuals_count
		wait_for_elements_exist [$usuals_count], timeout: $wait_time
		usuals_count=query("* id:'usuals_count'",:text).first
		puts "Favourites count is:#{usuals_count}"
	end

	def all_count
		all_string=query("* id:'all_btn'", "text").first
		all_count=all_string.scan(/\d/).join('')
		self.all_count_number(all_count)
	end



	def count_usuals
		usual_option_string=query("* id:'usuals_desc'", "text").first
		usual_option_count=usual_option_string.scan(/\d/).join('')
		self.usual_count(usual_option_count)
	end
end
