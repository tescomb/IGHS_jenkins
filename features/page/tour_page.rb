require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class TourPage < BasePage
	include Calabash::Android::Operations



	def trait
		"* id:'next_btn'"
	end



	def take_tour
		begin
			touch("* marked:'next_btn'")
			wait_for_elements_exist ["* marked:'next_btn'"], timeout: 2
			touch("* marked:'next_btn'")

		rescue

			touch("* marked:'next_btn'") if element_exists "* marked:'next_btn'"

		end
	end



	def advance_the_tour
		touch("* marked:'next_btn'") if element_exists "* marked:'next_btn'"
		sleep 2.0
	end


end