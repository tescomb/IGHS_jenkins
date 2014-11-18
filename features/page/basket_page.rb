require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class BasketPage < BasePage
	include Calabash::Android::Operations

	attr_accessor :guide_price_before, :guide_price_after



	def trait
		"* id:'HeaderTitle' {text contains[c] 'basket'}"
	end



	def guide_count_value_before(guide_price_before)
		self.guide_price_before=guide_price_before
	end



	def guide_price_value_after(guide_price_after)
		self.guide_price_after=guide_price_after
	end



	def empty_basket
    touch "* id:'basket_dropdown_layout'"
		wait_for_elements_exist [$empty_basket], timeout: $wait_time
		touch $empty_basket
		wait_for_elements_exist [$dialog_desc], timeout: $wait_time
	end



	def select_basket
		wait_for_elements_exist [$basket_header], timeout: $wait_time
		touch $basket_header
	end



	def confirm_empty_basket
		wait_for_elements_exist ["* id:'ok_btn'"]
		touch "* id:'ok_btn'"
		wait_for_elements_exist ["* id:'empty_basket_lay'"]
	end



	def basket_items_count
		basket_items_count = query("* id:'basket_items_count'")
		if basket_items_count.size > 0
			basket_items_count.first["text"].to_i
		else
			basket_items_count.size
		end
	end



	def assert_item_added
		item_value=query("* id:'pro_unitprice' index:1", :text)
		item_value_split=item_value.split("/")[0]
		pound_sym_split=item_value_split.split('£')
		item_value_in_intg=pound_sym_split.to_i
		return item_value_in_intg

	end



	def checkout
		wait_for_elements_exist ["* id:'check_out_btn'"], timeout: $wait_time
		touch "* id:'check_out_btn'"
		sleep(6)
		continue_button = "* marked:'Continue'"
		if (true == (element_exists(continue_button)))
			wait_for_elements_exist([continue_button], :timeout => $wait_time)
			touch(query(continue_button))
		end
		sleep(3)
	end



	def get_summary_price_before
		wait_for_elements_exist ["* id:'basket_guide_price'"], timeout: $wait_time
		basket_count=query("* id:'basket_guide_price'", :text).first
		basket_count_split=basket_count.split('£')[1]
		con_int=basket_count_split.to_f
		self.guide_count_value_before(con_int)
	end



	def get_summary_price_after
		sleep 3
		begin
			wait_for_elements_exist ["* id:'basket_guide_price'"], timeout: $wait_time
			basket_count=query("* id:'basket_guide_price'", :text).first
			basket_count_split=basket_count.split('£')[1]
			con_int=basket_count_split.to_f
			self.guide_price_value_after(con_int)
		rescue
			puts 'Handling exception'
		end
	end



	def remove_item_basket
		wait_for_elements_exist ["* id:'remove_btn'"], timeout: $wait_time
		rmv_button_state=query("* id:'remove_btn'").first
		touch rmv_button_state
	end
end