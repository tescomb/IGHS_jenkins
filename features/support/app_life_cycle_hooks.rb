require 'calabash-android/management/adb'
require 'calabash-android/operations'
require 'fileutils'
require 'net/smtp'

@@project_path=File.expand_path("../../../", __FILE__)
FileUtils.rm_rf(Dir.glob(@@project_path+'/screenshot/pass'+'/*.png'+''))
FileUtils.rm_rf(Dir.glob(@@project_path+'/screenshot/fail'+'/*.png'+''))


Before do |scenario|
#checks if the scenario is outlined
#copies default value 390 error code to test_data.txt under search


	unless File.directory?(@@project_path +'/screenshot/pass')
		FileUtils.mkdir_p(@@project_path+'/screenshot/pass')
	end
	@@path=@@project_path + "/screenshot"
	start_test_server_in_background
end

=begin
AfterStep do |scenario|
	sleep 1.5
	screenshot_embed(:prefix => @@path+'/pass/'+'', :name => "sc_#{Time.now.to_i}")
end
=end

After do |scenario|
	if scenario.failed?
		#screenshot_embed(:prefix => @@path+'/fail/', :name => "sc_#{Time.now.to_i}")
		screenshot_embed
		msg = "Subject: Hi Team.. Scenario failure for Android Phone!\n\n"+"This is a application failure for the scenario::"+scenario.title+"."+"\n\nThis needs to be addressed as soon as possible Please click on the link for detailed reports http://mobileappmonitoring.site11.com/sanity_reports/android_phone/dashboard/"+"\n\n Regards, \n\n Test Automation Team"
		smtp = Net::SMTP.new 'smtp.gmail.com', 587
		smtp.enable_starttls
	  	smtp.start('gmail.com', 'mobilehsc@gmail.com', 'tesco123', :login) do
			smtp.send_message(msg, 'mobilehsc@gmail.com', 'kristhegod55@gmail.com')
			smtp.send_message(msg, 'mobilehsc@gmail.com', 'emilyalicepage@gmail.com')
			smtp.send_message(msg, 'mobilehsc@gmail.com', 'rahul.khushoo@in.tesco.com')
			smtp.send_message(msg, 'mobilehsc@gmail.com', 'kishan.sundar@in.tesco.com')
      smtp.send_message(msg, 'mobilehsc@gmail.com', 'suhas.sukumar@in.tesco.com')
      smtp.send_message(msg, 'mobilehsc@gmail.com', 'akshata.tudavekar@in.tesco.com')
			smtp.send_message(msg, 'mobilehsc@gmail.com', 'gireesha.shenoy@in.tesco.com')
			smtp.send_message(msg, 'mobilehsc@gmail.com', 'Rajat.Pandit@uk.tesco.com')
		end
	end
	shutdown_test_server
end
