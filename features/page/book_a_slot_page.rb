require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'

class BookASlotPage < BasePage
	include Calabash::Android::Operations

	attr_accessor :slot, :slot_booked



	def trait
		"* id:'HeaderTitle' {text contains[c] 'Book a slot'}"
	end



=begin

def slot_details(slot)
	self.slot=slot
end
=end

	def slot_type(type)
		if type.downcase == "home delivery"
			home_delivery
		elsif type.downcase == "click and collect"
			click_and_collect
		else
			raise "That is not an option on the Book a slot page"
		end
	end



	def home_delivery
		wait_for_animate_2sec
		wait_for_elements_exist ["* id:'hd_book_a_slot_layout'"], timeout: $wait_time
		touch("* id:'hd_book_a_slot_layout'")
		wait_for_elements_do_not_exist ["* id:'LoadingProgress'"], timeout: $wait_time
		wait_for_animate_3sec
	end



	def choose_an_address
		wait_for_elements_exist [$select_address_spinner], timeout: $wait_time
		touch $select_address_spinner
		select_address=query("* id:'spinnerTarget'").size-1
		touch("* id:'spinnerTarget' index:#{select_address}")
	end



	def click_and_collect
		wait_for_animate_2sec
		wait_for_elements_do_not_exist ["* id:'LoadingProgress'"], timeout: $wait_time
		wait_for_elements_exist ["* id:'cc_book_a_slot_layout'"], timeout: $wait_time
	  touch("* id:'cc_book_a_slot_layout'")
		wait_for_elements_do_not_exist ["* id:'LoadingProgress'"], timeout: $wait_time
		wait_for_animate_2sec
	end



	def select_location
		wait_for_elements_exist [$location_click_collect], timeout: $wait_time
		touch("* id:'collection_point_address' index:0")
		wait_for_animate_3sec
	end



	def get_reserved_details
		wait_for_elements_exist ["* id:'slot_day'"], timeout: $wait_time
		day=query("* id:'slot_day'", :text).first
		date=query("* id:'slot_date'", :text).first
		month=query("* id:'slot_month'", :text).first
		@slot=Array.new
		@slot.push day
		@slot.push date
		@slot.push month
		puts @slot.size
	end



	def get_reserved_details_side_nav_hd
		wait_for_elements_exist ["* id:'hd_slot_booked_day'"], timeout: $wait_time
		day=query("* id:'hd_slot_booked_day'", :text).first
		date=query("* id:'hd_slot_booked_date'", :text).first
		month=query("* id:'hd_slot_booked_month'", :text).first
		@slot_booked=Array.new
		@slot_booked.push day
		@slot_booked.push date
		@slot_booked.push month
		puts @slot_booked.size
	end

	def get_reserved_details_side_nav_cc
		wait_for_elements_exist ["* id:'cc_slot_booked_day'"], timeout: $wait_time
		day=query("* id:'cc_slot_booked_day'", :text).first
		date=query("* id:'cc_slot_booked_date'", :text).first
		month=query("* id:'cc_slot_booked_month'", :text).first
		@slot_booked=Array.new
		@slot_booked.push day
		@slot_booked.push date
		@slot_booked.push month
		puts @slot_booked.size
	end


	def enter_postcode_Add_new_address
		wait_for_elements_exist [$search_postcode_address], timeout: $wait_time
		touch($search_postcode_address)
		query("* id:'search_by_postcode_text'", :setText => "LL219YB")
	end

	def add_new_address_button
		wait_for_elements_do_not_exist ["* id:'LoadingProgress'"]
		wait_for_elements_exist ["* {text contains[c] 'Changing your address might mean'}"], timeout: 30
		query_string = "* id:'add_new_address'"
		wait_poll until_exists: query_string, timeout: 65 do
			scroll_down
		end
		wait_for_animation
		touch query_string
		wait_for_elements_exist ["* id:'search_by_postcode_text'"], timeout: 30
	end

	def random_nickname_generate
		rand_password = ('0'..'z').to_a.shuffle.first(8).join
		return rand_password
	end



	def addnew_address_details
		wait_for_elements_exist [$select_address_spinner], timeout: $wait_time
		touch $select_address_spinner
		wait_for_elements_exist [$choose_address], timeout: $wait_time
		touch $choose_address
		wait_for_elements_exist [$add_property_spinner], timeout: $wait_time
		touch $add_property_spinner
		wait_for_elements_exist [$choose_address], timeout: $wait_time
		touch $choose_address
		#mobile_no ="07987654321"
		add_nick_mame = "* id:'address_nick_name'"
		nick_name = random_nickname_generate()
		touch(add_nick_mame)
		query("* id:'address_nick_name'", :setText => "#{nick_name}")
		performAction('scroll_down')
		#query("* id:'mobile_text'", :setText => "#{mobile_no}")
		if query("* id:'day_time_number_text'").empty?
			performAction('scroll_down')
		else
			query("* id:'day_time_number_text'", :setText => "0789654123")
			sleep(1)
			query("* id:'evening_number_text'", :setText => "0789654123")
			performAction('go_back')
		end

	end



	def Addnew_done_button
		wait_for_elements_exist [$add_done_button], timeout: $wait_time
		touch $add_done_button
	end



	def get_reserved_details_from_basket_cc
		wait_for_elements_exist ["* id:'date_info_lay'"], timeout: $wait_time
		day=query("* id:'day'", :text).first
		date=query("* id:'date'", :text).first
		month=query("* id:'month'", :text).first
		@slot_booked=Array.new
		@slot_booked.push day
		@slot_booked.push date
		@slot_booked.push month
		puts @slot_booked.size
	end
end