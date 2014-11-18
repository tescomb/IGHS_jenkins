require 'calabash-android/abase'
require 'test/unit/assertions'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
include Test::Unit::Assertions

module Tesco

	attr_accessor :basket_count_total_before, :basket_count_total_after, :item_value, :item_value_added



	def basket_count_value(basket_count_total_before)
		self.basket_count_total_before=basket_count_total_before
	end



	def basket_count_value_after(basket_count_total_after)
		self.basket_count_total_after=basket_count_total_after
	end



	def valueofitem(item_value)
		self.item_value=item_value
	end



	def valueofitemadded(item_value_added)
		self.item_value_added=item_value_added
	end



	def enter_credentials(username, password)
		wait_for_elements_exist [$username_field], timeout: $wait_time
		query($username_field, :setText => "#{username}")
		query($password_field, :setText => "#{password}")
	end



	def assert_element_on_screen(actual)
		escape_special_char=actual.gsub("'", "")
		mark = escape_quotes(actual)
		wait_for_elements_exist ["* marked:'#{mark}'"], timeoout: 20
		on_screen=query("* RobotoTextView", :text)
		count_arry =on_screen.count
		new_ele=Array.new
		count_arry.times do |i|
			new_ele.push on_screen[i].gsub("'", "")
		end
		expected= new_ele.include? escape_special_char
		assert expected, "Application could not see" + escape_special_char
	end



	#####################################################
	# For Example:                                      #
	#  assert_send([[1, 2], :member?, 1]) # -> pass     #
	#  assert_send([[1, 2], :member?, 4]) # -> fail     #
	#####################################################
	def assert_array_element(array_list, expected_in_array)
		assert_send([array_list, :member?, expected_in_array], message='Element'+expected_in_array+' not present in array list')
	end



	def assert_element_not_same(expected, actual)
		assert_not_equal(expected, actual, message='Expected::'+expected.to_s+' and Actual::'+actual.to_s+' are holding the same value')
	end



	def assert_element_equal(expected, actual)
		assert_equal(expected, actual)
	end



	######################################################################
	# For Example:                                                        #
	#  assert_two_arrays([1,2],[2,1],msg='arrays not same') # -> pass     #
	#  assert_two_arrays([1,2],[1,1],msg='arrays not same') # -> fail     #
	######################################################################

	def assert_two_arrays(a1, a2, msg = nil)
		[:select, :inject, :size].each do |m|
			[a1, a2].each { |a| assert_respond_to(a, m, "Are you sure that #{a.inspect} is an array?  It doesn't respond to #{m}.") }
		end
		assert a1h = a1.inject({}) { |h, e| h[e] ||= a1.select { |i| i == e }.size; h }
		assert a2h = a2.inject({}) { |h, e| h[e] ||= a2.select { |i| i == e }.size; h }
		assert_equal(a1h, a2h, msg)
	end



	def assert_two_arrays_not_same(a1, a2, msg = nil)
		[:select, :inject, :size].each do |m|
			[a1, a2].each { |a| assert_respond_to(a, m, "Are you sure that #{a.inspect} is an array?  It doesn't respond to #{m}.") }
		end
		assert a1h = a1.inject({}) { |h, e| h[e] ||= a1.select { |i| i == e }.size; h }
		assert a2h = a2.inject({}) { |h, e| h[e] ||= a2.select { |i| i == e }.size; h }
		assert_not_equal(a1h, a2h, msg)
	end



	def wait_for_none_animating
		sleep 8
	end



	def until_element_exists element, action
		wait_poll until_exists: element, timeout: $wait_time do
			action.call
		end
	end



	def once_element_exists element, action = lambda { touch element }
		#With this time out you better be sure it will show
		wait_for_elements_exist [element], timeout: $wait_time
		action.call
	end



	def scroll_down_to? element
		performAction "scroll_down"
		element_exists element
	end



	def scroll_up_to? element
		performAction "scroll_up"
		element_exists element
	end



	def assert_true(bool, msg)
		assert(bool, msg)
	end



	def wait_for_animate_3sec
		sleep(3)
	end



	def wait_for_animate_2sec
		sleep(2)
	end



	def wait_for_animation
		sleep(1)
	end



	def wait_for_animate_5sec
		sleep(5)
	end



	def add_mutiple_items
		wait_for_elements_exist ["* id:'add_btn'"], timeout: $wait_time
		3.times do |i|
			touch "* id:'add_btn' index:#{i}"
			if element_exists $username_field
				puts 'sign in module'
			elsif element_exists "* marked:'closeDialogButton'"
				touch "* marked:'closeDialogButton'"
			else
				wait_for_elements_exist [$guide_price], timeout: $wait_time
			end
		end
	end



	def open_side_nav
		begin
			wait_for_elements_exist [$lhn], timeout: $wait_time
			touch($lhn)
			sleep(2)
			assert_true(!query("ListView RelativeLayout index:0").empty?, 'Side nav not open--code moved to catch block')
		rescue
			#performAction('drag', 1, 99, 50, 40, 50)
			wait_for_elements_exist [$lhn], timeout: $wait_time
			touch($lhn)
			sleep(2)
			assert_true(!query("ListView RelativeLayout index:0").empty?, 'Side nav not open--code in catch block')
		end

	end

	def close_side_nav
		begin
			wait_for_elements_exist [$lhn], timeout: $wait_time
			touch($lhn)
			sleep(2)
			assert_true(query("ListView RelativeLayout index:0").empty?, 'Side nav not open--code moved to catch block')
		rescue
			#performAction('drag', 99, 1, 50, 40, 50)
			wait_for_elements_exist [$lhn], timeout: $wait_time
			touch($lhn)
			sleep(2)
			assert_true(query("ListView RelativeLayout index:0").empty?, 'Side nav not open--code in catch block')
		end

	end



	def previous_page
		if element_exists "* marked:'OK'"
			touch "* marked:'OK'"
		end
		wait_for_elements_exist ["android.widget.ImageView id:'action_bar_up_navigation'"], timeout: $wait_time
		touch("android.widget.ImageView id:'action_bar_up_navigation'")
		sleep 1.0
	end



	def my_basket
		wait_for_elements_exist ["* id:'basket_action_bar_up'"], timeout: $wait_time
		touch("* id:'basket_action_bar_up'")
		sleep 2.0
	end



	def add_buy1_get1_item
		wait_for_elements_exist ["* id:'basket_action_bar_up'"], timeout: $wait_time
		touch("* id:'basket_action_bar_up'")
		sleep 2.0
	end



	def scroll_down
		back_button_anchor = query "android.widget.ImageView id:'action_bar_up_navigation'"
		x = back_button_anchor.first["rect"]["center_x"]
		y = back_button_anchor.first["rect"]["center_y"]

		performAction('drag_coordinates', x, 10*y, x, y)
	end



	def scroll_down_a_bit
		back_button_anchor = query "android.widget.ImageView id:'action_bar_up_navigation'"
		x = back_button_anchor.first["rect"]["center_x"]
		y = back_button_anchor.first["rect"]["center_y"]

		performAction('drag_coordinates', x, 3*y, x, y)
	end



	def scroll_up
		back_button_anchor = query "android.widget.ImageView id:'action_bar_up_navigation'"
		x = back_button_anchor.first["rect"]["center_x"]
		y = back_button_anchor.first["rect"]["center_y"]

		performAction('drag_coordinates', x, 2*y, x, 10*y)
	end



	# Gets the value of the product and returns
	def get_valueof_item_adding
		wait_for_elements_exist ["* id:'pro_item_price' index:0"], timeout: $wait_time
		value_of_item=query("* id:'pro_item_price' index:0", :text).first
		value_of_item_split=value_of_item.split('£')[1]
		item_value=value_of_item_split.to_f
		self.valueofitem(item_value)
	end



	# Gets the value of the product after adding to the basket
	def get_valueof_item_added
		value_of_item=query("* id:'pro_item_price' index:0", :text).first
		value_of_item_split=value_of_item.split('£')[1]
		item_value_added=value_of_item_split.to_f
		self.valueofitemadded(item_value_added)
	end



	def get_basket_value_after
		step 'I wait for the view with id "LoadingProgress" to disappear with loop 2'
		if element_exists "* id:'basket_guide_price'"
			begin
				wait_for_elements_exist ["* id:'basket_guide_price'"], timeout: $wait_time
				basket_count=query("* id:'basket_guide_price'", :text).first
				basket_count_split=basket_count.split('£')[1]
				con_int=basket_count_split.to_f
				self.basket_count_value_after(con_int)
			rescue
				if element_exists "* id:'basket_guide_price'"
					begin
						wait_for_elements_exist ["* id:'basket_guide_price'"], timeout: $wait_time
						basket_count=query("* id:'basket_guide_price'", :text).first
						basket_count_split=basket_count.split('£')[1]
						con_int=basket_count_split.to_f
						self.basket_count_value_after(con_int)
					else
						fail 'basket value is not loaded'
					end
				end
			end
		elsif element_exists "* id:'basket_action_bar_up'"
			begin
				wait_for_elements_exist ["* id:'basket_action_bar_up'"], timeout: $wait_time
				basket_count=query("* id:'basket_action_bar_up'", :text).first
				basket_count_split=basket_count.split('£')[1]
				con_int=basket_count_split.to_f
				self.basket_count_value_after(con_int)
			rescue
				if element_exists "* id:'basket_action_bar_up'"
					begin
						wait_for_elements_exist ["* id:'basket_action_bar_up'"], timeout: $wait_time
						basket_count=query("* id:'basket_action_bar_up'", :text).first
						basket_count_split=basket_count.split('£')[1]
						con_int=basket_count_split.to_f
						self.basket_count_value_after(con_int)
					else
						fail 'basket value is not loaded'
					end
				end
			end
		end
	end



	def get_basket_value_before
		step 'I wait for the view with id "LoadingProgress" to disappear with loop 2'
		if element_exists "* id:'basket_guide_price'"
			begin
				wait_for_elements_exist ["* id:'basket_guide_price'"], timeout: $wait_time
				basket_count=query("* id:'basket_guide_price'", :text).first
				basket_count_split=basket_count.split('£')[1]
				con_int=basket_count_split.to_f
				self.basket_count_value(con_int)
			rescue
				begin
					wait_for_elements_exist ["* id:'basket_guide_price'"], timeout: $wait_time
					basket_count=query("* id:'basket_guide_price'", :text).first
					basket_count_split=basket_count.split('£')[1]
					con_int=basket_count_split.to_f
					self.basket_count_value(con_int)
				rescue
					fail 'basket value is not displayed'
				end
			end
		elsif element_exists "* id:'basket_action_bar_up'"
			begin
				wait_for_elements_exist ["* id:'basket_action_bar_up'"], timeout: $wait_time
				basket_count=query("* id:'basket_action_bar_up'", :text).first
				basket_count_split=basket_count.split('£')[1]
				con_int=basket_count_split.to_f
				self.basket_count_value(con_int)
			rescue
				begin
					wait_for_elements_exist ["* id:'basket_action_bar_up'"], timeout: $wait_time
					basket_count=query("* id:'basket_action_bar_up'", :text).first
					basket_count_split=basket_count.split('£')[1]
					con_int=basket_count_split.to_f
					self.basket_count_value(con_int)
				rescue
					fail 'basket value is not displayed'
				end
			end
		end
	end



	def add_item
		# by default this will only add the first item in the array of items in the list.
		# we can get more sophisicated to decide which item we want to choose, but I think this works
		# as a proof of concept for now
		begin
			wait_for_elements_exist ["* marked:'bulk_add_btn'"], timeout: 3
			if element_exists "* marked:'bulk_add_btn'"
				performAction('drag', 50, 50, 50, 20, 10)
			end
		rescue
			'nothing to drag'
		end
		wait_for_elements_exist ["* id:'add_btn'"], timeout: $wait_time
		if array_element_exists(["* marked:'VIEW ALL'"])
			touch("* id:'add_btn' index:0")
			product_title=query("* id:'dashboard_selected_fav_title_tv' index:0", :text).first
			project_path=File.expand_path("../../../", __FILE__)
			path= project_path + "/test_data/product.txt"
			File.open(path, 'w') { |f| f.write(product_title) }
		elsif element_exists "* marked:'Basket'"
			until query("* id:'add_btn'", :isEnabled).first
				performAction('drag', 50, 50, 50, 20, 10)
				sleep 1
				touch("* id:'add_btn' index:0")
			end
			sleep 2
			touch("* id:'add_btn' index:0")
			if element_exists "* id:'basket_header_loader_image'"
				wait_for_elements_do_not_exist ["* id:'basket_header_loader_image'"], timeout: $wait_time
			end
			product_title=query("* id:'pro_title' index:0", :text).first
			project_path=File.expand_path("../../../", __FILE__)
			path= project_path + "/test_data/product.txt"
			File.open(path, 'w') { |f| f.write(product_title) }
		elsif element_exists "* id:'prod_name'"
			touch("* id:'add_btn' index:0")
		else
			until query("* id:'pro_title'", :isEnabled).first
				performAction('drag', 50, 50, 50, 20, 10)
				sleep 1
				touch("* id:'add_btn' index:0")
				wait_for_any_element(["* marked:'GUIDE PRICE'", "* marked:'Guide price'"], timeout: $wait_time)
				product_title=query("* id:'pro_title' index:0", :text).first
				project_path=File.expand_path("../../../", __FILE__)
				path= project_path + "/test_data/product.txt"
				File.open(path, 'w') { |f| f.write(product_title) }
			end
			touch("* id:'add_btn' index:0")
			wait_for_any_element(["* marked:'GUIDE PRICE'", "* marked:'Guide price'"], timeout: $wait_time)
			product_title=query("* id:'pro_title' index:0", :text).first
			project_path=File.expand_path("../../../", __FILE__)
			path= project_path + "/test_data/product.txt"
			File.open(path, 'w') { |f| f.write(product_title) }
		end
		begin
			if element_exists $username_field
				puts 'sign in module'
			elsif element_exists "* marked:'closeDialogButton'"
				if element_does_not_exist $username_field
					touch "* marked:'closeDialogButton'"
				end
			else
				wait_for_any_element(["* marked:'GUIDE PRICE'", "* marked:'Guide price'"], timeout: $wait_time)
			end
		rescue
			puts 'handling exception'
		end


	end



	def remove_item
		#by default this will only remove the first item in the array of items in the list.
		wait_for_elements_exist [$add_item], timeout: $wait_time
		touch($remove_item)
		wait_for_elements_do_not_exist [$remove_item], timeout: $wait_time
	end



	def add_another_item
		# by default this will only add the first item in the array of items in the list.
		# we can get more sophisicated to decide which item we want to choose, but I think this works
		# as a proof of concept for now
		wait_for_animate
		touch("button index:3")
		if element_exists $username_field
			puts 'sign in module'
		else
			wait_for_elements_exist ["* marked:'GUIDE PRICE'"], timeout: 30
		end
	end



	def initiate_search
		wait_for_elements_exist ["android.widget.ImageView  id:'search_action_bar'"], timeout: $wait_time
		touch("android.widget.ImageView  id:'search_action_bar'")
		sleep 2
	end



	def dismiss_dialogue
		if element_exists "* marked:'ok_single_btn'"
			touch "* marked:'ok_single_btn'"
			wait_for_elements_do_not_exist ["* marked:'ok_single_btn'"]
		else
			query_size = query("*").size - 1
			touch("* index:#{query_size}") if element_exists "* index:#{query_size}"
			wait_for_elements_do_not_exist ["* index:#{query_size}"]
		end
	end



	def save_order_changes
		query_string = "* id:'saveAmend'"
		dialogue_query_string = "* id:'ok_btn'"
		if element_exists query_string
			touch query_string
			wait_for_elements_exist [dialogue_query_string]
			touch dialogue_query_string
		else
			raise "You had no changes to save!"
		end
	end



	def outstanding_changes?
		begin
			wait_for_elements_exist ["* id:'saveAmend'"], timeout: 5
			element_exists "* id:'saveAmend'"
		rescue
			element_exists "* id:'saveAmend'"
		end
	end



	def cancel_order_changes
		query_string = "* id:'cancelAmend'"
		dialogue_query_string = "* id:'ok_btn'"
		if element_exists query_string
			touch query_string
			wait_for_elements_exist [dialogue_query_string], timeout: $wait_time
			touch dialogue_query_string
		else
			raise "You had no changes to save!"
		end
	end



	def visible?(uiquery)
		frame_height = (query "FrameLayout")[0]["rect"]["height"]
		frame_width = (query "FrameLayout")[0]["rect"]["width"]
		test_height = (query uiquery)[0]["rect"]["center_y"]
		test_width = (query uiquery)[0]["rect"]["center_x"]

		if within_frame_y?(test_height, frame_height) && within_frame_x?(test_width, frame_width)
			true
		else
			false
		end

	end



	def within_frame_y?(test_height, frame_height)
		test_height < frame_height && test_height > 0
	end



	def within_frame_x?(test_width, frame_width)
		test_width < frame_width && test_width > 0
	end



	def escape_quotes(str)
		str.gsub("'", "\\\\'")
	end



	def touch_element(element_id)
		query_string = "* marked:'#{element_id}'"
		if element_exists query_string
			touch query_string
		else
			raise "Element does not exist"
		end
	end



	def delete_item
		@@count=0
		total_remove_item=query("* id:'remove_btn'").size
		if element_exists "* id:'basket_action_bar_up'"
			get_basket_value_before
		end
=begin
		total_remove_item.times do
			@@count||=0
			touch "* id:'remove_btn' index:#{@@count}"
			sleep 1
			@@count+=1
		end
=end
		if array_element_exists(["* marked:'Basket'", "* marked:'VIEW ALL'"])
			touch("* id:'remove_btn' index:0")
			total_add=query("* id:'remove_btn'").size
			basket_product=Array.new
			total_add.times do |i|
				basket_product.push query("* id:'pro_title' index:#{i}", :text).first
			end
			basket_product.count.times do |i|
				text_on_screen=query("* id:'pro_title' index:#{i}", :text).first
				#if File.readlines(File.expand_path("../../../", __FILE__) + "/test_data/product.txt")[0].gsub("\n", '') == text_on_screen
				#	if (query("* id:'remove_btn' index:#{i}", :isEnabled).first) then
				if element_exists "* id:'remove_btn' index:#{i+1}"
					touch("* id:'remove_btn' index:#{i+1}")
				end
				#	end
				#end
			end
		elsif element_exists "* id:'prod_name'"
			touch("* id:'remove_btn' index:0")
		else
			until query("* id:'pro_title'", :isEnabled).first
				performAction('drag', 50, 50, 50, 20, 10)
				if File.readlines(File.expand_path("../../../", __FILE__) + "/test_data/product.txt")[0].gsub("\n", '') == query("* id:'pro_title'", :text).first
					if query("* id:'remove_btn'", :isEnabled)
						touch_element('remove_btn')
					else
						screenshot_and_raise 'Item was not added in the previous case'
					end
				end
			end
			@@pro_title_count||=3
			@@pro_title_count.times do
				if File.readlines(File.expand_path("../../../", __FILE__) + "/test_data/product.txt")[0].gsub("\n", '') == query("* id:'pro_title'", :text).first
					if query("* id:'remove_btn'", :isEnabled)
						touch_element('remove_btn')
						break
					else
						performAction('drag', 50, 50, 50, 20, 10)
						@@pro_title_count=+3
					end
				end
			end
		end


		if element_exists "* id:'basket_action_bar_up'"
			get_basket_value_after
		elsif if element_exists "* marked:'closeDialogButton'"
			      touch "* marked:'closeDialogButton'"
		      end
		end
	end



	def check_product_available
		begin
			wait_for_elements_exist [$product_general], timeout: 120
			if element_does_not_exist ($product_general)
				pending "Products are not avilable in the screen. Hence failed the case"
			end
		rescue
			pending "Products are not avilable in the screen. Hence failed the case"
		end
	end



	def verify_item_added
		wait_for_elements_exist ["* id:'remove_btn'"], timeout: $wait_time
		begin
			query("* id:'remove_btn'", :isEnabled)
		rescue
			pending "The remove button is not enabled"
		end
	end



	def array_element_exists(elements_arr, options={})
		options[:timeout_message] = options[:timeout_message] || "Timeout waiting for elements: #{elements_arr.join(",")}"
		elements_arr.any? { |q| element_exists(q) }
	end



	def wait_for_any_element(elements_arr, options={})
		options[:timeout_message] = options[:timeout_message] || "Timeout waiting for elements: #{elements_arr.join(",")}"
		wait_for(options) do
			elements_arr.any? { |q| element_exists(q) }
		end
	end

end


World(Tesco)
