require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
require 'calabash-android/abase'

class SpecialOffersPage < BasePage
	include Calabash::Android::Operations

	attr_accessor :selection_state, :offer_header_text, :offer_validity_offer, :offer_validity_main, :enabled_state



	def select_state(selection_state)
		self.selection_state=selection_state
	end



	def offer_header(offer_header_text)
		self.offer_header_text=offer_header_text
	end



	def offer_validity_store(offer_validity_offer)
		self.offer_validity_offer=offer_validity_offer
	end



	def offer_validity_product(offer_validity_main)
		self.offer_validity_main=offer_validity_main
	end



	def enable_state_store(enabled_state)
		self.enabled_state=enabled_state
	end



	def trait
		"* id:'HeaderTitle' {text contains[c] 'special offers'}"
	end



	def offers_selection(offer_name)
		offers_name = query("* marked:'#{offer_name}'", :isActivated).first
		self.select_state(offers_name)
	end



	def tapping_offers(offer_name)
		begin
      wait_for_elements_exist ["* marked:'#{offer_name}'"], timeout: $wait_time
      if query("* marked:'#{offer_name}'", :isEnabled)
				touch ("* marked:'#{offer_name}'")
			end
		rescue
			pending ("The #{offer_name} was not enabled")
		end
	end



	def offer_description_link
		wait_for_elements_exist [$special_offer_screen], timeout: $wait_time
		touch($special_offer_screen)
		sleep 5
		offer_descrition_text=query($special_offer_screen, "text").first
		self.offer_validity_product(offer_descrition_text)
	end



	def offer_screen_header
		wait_for_elements_exist [$special_offer_screen], timeout: $wait_time
		offer_text= query($offer_header, "text").first
		self.offer_header(offer_text)
	end



	def offer_validity
		wait_for_elements_exist [$offer_header], timeout: $wait_time
		offer_text = query("* id:'offer_text'", "text").first
		offer_validity = query("* id:'offerValidity'", "text").first
		offer = offer_text+' '+offer_validity
		self.offer_validity_store (offer)
	end



	def special_offers_disabled
		wait_for_elements_exist [$product_general], timeout: $wait_time
		enable_state = query($special_offer_tab, :isEnabled).first
		self.enable_state_store(enable_state)
	end

end