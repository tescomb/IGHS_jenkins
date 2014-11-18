require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'

class AnonymousPage < BasePage
	include Calabash::Android::Operations



	def chk_Status

		if element_exists("* marked:'OK'")
			clubcard_pop = "* marked:'OK'"
			touch(clubcard_pop)
			sleep(2)
		end

		if element_exists("* marked:'Change Clubcard'")
			puts("Clubcard already added")
			remove_Card
		else
			puts("Clubcard not added")
		end

	end



	def add_clubcard
		touch($clubcard_button)
		change_btn = "* marked:'Change Clubcard'"
		wait_for_elements_exist [change_btn], timeout: $wait_time
	end



	def closeclubcard
		touch("* id:'action_bar_up_navigation'")
		touch("* marked:'Home'")
	end



	def enter_details

		join_btn = "* marked:'Join Clubcard'"
		wait_for_elements_exist [join_btn], timeout: $wait_time
		#touch("* id:'action_bar_up_navigation'")
		postcode="* marked:'Postcode'"
		touch(postcode)
		query("* id:'postcode'", :setText => "LL219YB")

		#keyboard_enter_text "LL219YB"
		sleep(2)
		cardnumber ="* marked:'Clubcard number'"
		touch(cardnumber)
		query("* id:'clubcard_number'", :setText => "634004024126176181")
		#keyboard_enter_text "634004024126176181"
		sleep(2)
	end



	def remove_Card

		#Select change card
		change_card="* id:'change_card_btn'"
		touch(change_card)
		wait_for_animation

		#remove card
		remove="* id:'remove_card_btn'"
		touch(remove)
		wait_for_elements_exist ["* id:'ok_btn'"], timeout: $wait_time
		popremove="* id:'ok_btn'"
		touch(popremove)
		wait_for_animation

	end



	def add_Card(post_code, clubcard_number, type)

		chk_Status

		#add_clubcard

		join_btn = "* marked:'Join Clubcard'"
		wait_for_elements_exist [join_btn], timeout: $wait_time
		postcode="* marked:'Postcode'"
		touch(postcode)
		query("* id:'postcode'", :setText => "LL219YB")
		wait_for_elements_exist ["* marked:'Clubcard number'"], timeout: $wait_time
		cardnumber ="* marked:'Clubcard number'"
		touch(cardnumber)
		query("* id:'clubcard_number'", :setText => "634004024126176181")
		wait_for_animate_5sec
		clubcard_button ="* id:'add_clubcard_btn'"
		touch(clubcard_button)
		wait_for_elements_exist ["* id:'cc_mobile_site'"], timeout: $wait_time


		if element_exists("* marked:'Continue'")
			clubcard_popup = "* marked:'Continue'"
			touch(clubcard_popup)
			wait_for_animate_5sec
		end
	end
end