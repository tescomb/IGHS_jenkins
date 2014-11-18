require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'
class BuyList < BasePage
  include Calabash::Android::Operations



  def trait
    "* marked:'basket_action_bar_down' {text contains[c] 'ITEMS'}"
  end



  def buylist_nav_LHN
    wait_for_elements_exist [$lhn], timeout: $wait_time
    seasonal_buylist_str = query("* marked:'title'", :text)[4]
    seasonal_buylist_nav = "* marked:'#{seasonal_buylist_str}'"
    sleep(2)
    if seasonal_buylist_nav
      touch(seasonal_buylist_nav)
      sleep 2
    else
      raise "sesonal buy list option is not displayed in LHN"
    end
  end



  def verify_categories
    wait_for_elements_exist ["* id:'menu_name'"], timeout: $wait_time
    buylist_categories_count = query("* id:'menu_name'").size-1
    while buylist_categories_count >= 0
      touch("* id:'menu_name' index:#{buylist_categories_count}")
      buylist_category_selected=query($buylist_categories, :isActivated)
      if buylist_category_selected
        puts "Buy list categories is selected"
      else
        raise "Buy list categories is not selected"
      end
      add_item
      buylist_categories_count -= 1
    end
  end



  def buylist_banner
    sleep 10
    wait_poll(:until_exists => "* marked:'buylist_banner'", :timeout => 20) do
      performAction('drag', 70, 10, 80, 0, 3)
    end
    buylist_img = "* marked:'buylist_banner'"
    wait_for_elements_exist [buylist_img], timeout: $wait_time
    if element_exists buylist_img
      touch buylist_img
      sleep 2
    else
      raise "Buy list banner not displayed in dashboard"
    end
  end
end
