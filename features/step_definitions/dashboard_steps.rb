Given(/^i am on anonymous dashboard$/) do
  @@dashboard_page.dashboard_login_status
end

When(/^i login to the application from anonymous dashboard$/) do
  @@dashboard_page.dashbaord_sign_in
end
