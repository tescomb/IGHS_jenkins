require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class JustChecking < BasePage
  include Calabash::Android::Operations



  def trait
    "* id:'HeaderTitle' {text contains[c] 'Just checking'}"
  end



  def justchecking_book_slot
    sleep 5
    if element_exists "* marked:'order_type'"
      "Booked slot is present in justcheking screen"
    else
      raise "Booked slot is not displayed in justcheking screen"
    end
  end



  def nav_book_slot
		sleep 4
    order_type_HD = "* marked:'Home Delivery'"
    order_type_CC = "* marked:'Click & Collect'"
    if element_exists order_type_HD
      touch(order_type_HD)
      sleep 5
      #wait_for_elements_exist ["* marked:'book_slot_choose_grid_textview"], timeout: 30
    elsif order_type_CC
      touch(order_type_CC)
      sleep 10
      #wait_for_elements_exist ["* marked:'book_slot_choose_grid_textview"], timeout: 30
    else
      raise "Slots are not booked"
    end
  end
end
