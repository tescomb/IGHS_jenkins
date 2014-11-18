require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'

class ChooseASlotPage < BasePage
  include Calabash::Android::Operations


  def trait
    "* id:'HeaderTitle' {text contains[c] 'choose a slot'}"
  end


  def swipe_dates
    wait_for_elements_do_not_exist ["* id:'LoadingProgress'"]
    scroll_view = query "* id:'horizontalScrollView1'"

    x = scroll_view.first["rect"]["center_x"]
    y = scroll_view.first["rect"]["center_y"]
    performAction('drag_coordinates', x, y, -10*x, y)
  end


  def select_date(index=1)
    last_date = query("* id:'dayOfMonth'").size - index
    touch "* id:'dayOfMonth' index:#{last_date}"
    wait_for_elements_do_not_exist ["* id:'LoadingProgress'"], :timeout => $wait_time
  end


  def select_time
    query_string = "* id:'slotPrice' {text contains[c] '£'}"

    i = 1
    wait_poll until_exists: query_string, timeout: $wait_time do
      select_date(i)
      i += 1
    end

    touch(query_string)
    sleep 2
		 if element_exists "* marked:'Book this slot'"
			 touch "* marked:'Book this slot'"
		 else
			 touch "* marked:'Book new slot'"
		 end

    if element_exists "* id:'ok_btn'"
	    touch "* id:'ok_btn'"
		end
  end


  def select_time_tab
    #wait_for_elements_exist ["* marked:'bookNewSlot'"], timeout:30
    wait_for_elements_exist ["* marked:'book_slot_choose_grid_textview'"], timeout: $wait_time
    book_a_slot_btn = (query "* marked:'book_slot_btn'", :isEnabled).first
    ary = query "* id:'book_slot_choose_grid_textview'", :text
    slot_info = ary.reject! { |s| s.empty? }
    puts "AVAILABLE SLOTS :"+"\n"
    print slot_info
    ary_size =slot_info.size
    until book_a_slot_btn #|| catch_value == 1 do
	    @@count||=ary_size
	    present=query("* id:'book_slot_choose_grid_textview'")[@@count]["text"].include?'£'
	    if present
	    touch("* id:'book_slot_choose_grid_textview' index:#{@@count}")
				puts @@count
	    end
	    @@count-=1
      book_a_slot_btn = (query "* marked:'book_slot_btn'", :isEnabled).first
    end
    touch "* id:'book_slot_btn'"
    # end
  end


  def change_slot_in_amend
    wait_for_elements_exist ["* id:'book_slot_choose_grid_textview'"], timeout: $wait_time
    touch("* id:'text1' index:2")
    wait_for_elements_exist ["* id:'book_slot_choose_grid_textview'"], timeout: $wait_time
    ary = query "* id:'book_slot_choose_grid_textview'", :text
    slot_info = ary.reject! { |s| s.empty? }
    puts "AVAILABLE SLOTS :"+"\n"
    print slot_info
    ary_size = slot_info.count
    book_new_slot_disabled=(query "* marked:'bookNewSlot'", :isEnabled).first
    until book_new_slot_disabled == true #|| catch_value == 1 do
      @@count||=ary_size
      touch("* id:'book_slot_choose_grid_textview' index:#{@@count}")
      @@count-=1
      book_new_slot_disabled = (query "* marked:'bookNewSlot'", :isEnabled).first
    end
    touch "* marked:'bookNewSlot'"
  end


  def book_slot
    wait_for_elements_exist ["* id:'book_slot_btn'"], timeout: $wait_time
    touch("* id:'book_slot_btn'")
  end


  def book_new_slot
    wait_for_elements_exist ["* id:'bookNewSlot'"], timeout: $wait_time
    touch("* id:'bookNewSlot'")
  end

end