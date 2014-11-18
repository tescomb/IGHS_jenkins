require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'

class DashboardPage < BasePage
  include Calabash::Android::Operations



  def dashboard_login_status
    begin
      if element_exists $dashboard_sign_in
        puts"I am in dashboard"
      end
    rescue
      open_side_nav
      if element_exists $sign_out
        touch $sign_out
        wait_for_elements_exist ["* marked:'ok_btn'"], timeout: $wait_time
        touch "* marked:'ok_btn'"
        wait_for_elements_exist [$lhn], timeout: $wait_time
        open_side_nav
      end

    end
  end

  def dashbaord_sign_in
    if element_exists $dashboard_sign_in
      touch $dashboard_sign_in
    end
  end

  end