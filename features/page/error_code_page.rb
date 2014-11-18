require 'calabash-android/abase'
require File.dirname(__FILE__) + '/../../features/repo_id/ids'
require File.dirname(__FILE__) + '/../../features/page/basepage'

class ErrorCodePage < BasePage
	include Calabash::Android::Operations

	attr_accessor :message_value



	def message_state(message_value)
		self.message_value=message_value
	end



	def fetch_error_message(arg)
		wait_for_elements_exist ["* marked:'#{arg}'"], timeout: 30
		expected=query("tescoui.customfontcomponents.RobotoTextView", "text")
		bool_exp=expected.include? arg
		self.message_state(bool_exp)
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



	def error_code_delivery_slot(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/LISTDELIVERYSLOTS/test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/LISTDELIVERYSLOTS/'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end



	def error_code_collection_point(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/LISTCOLLECTIONPOINTS/test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/LISTCOLLECTIONPOINTS/'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end



	def error_code_collection_slot(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/LISTCOLLECTIONSLOTS/test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/LISTCOLLECTIONSLOTS/'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end



	def error_code_empty_basket(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/EMPTYBASKET/test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/EMPTYBASKET/'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end



	def error_code_change_basket(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/CHANGEBASKET/test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/CHANGEBASKET/'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end



	def error_code_choose_delivery(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/CHOOSEDELIVERYSLOT/test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/CHOOSEDELIVERYSLOT/'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end



	def error_code_choose_collection(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/CHOOSECOLLECTIONSLOT/test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/CHOOSECOLLECTIONSLOT/'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end



	def error_code_ready_checkout(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/READYFORCHECKOUT/test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/READYFORCHECKOUT/'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end



	def error_code_just_checking(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/JUSTCHECKING/test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/JUSTCHECKING/'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end



	def error_code_listing_usuals(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/LISTUSUALS/test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/LISTUSUALS/'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end



	def error_code_list_basket(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/LISTBASKET/test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/LISTBASKET/'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end



	def error_code_list_favourites(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/LISTFAVOURITES /test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/LISTFAVOURITES /'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end



	def error_code_slot_info(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/GETCHOSENSLOTINFO/test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/GETCHOSENSLOTINFO/'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end



	def error_code_collection_address(file)
		project_path=File.expand_path("../../../", __FILE__)
		path= project_path + '/test_data/GETCOLLECTIONPOINTADDRESS/test_data.txt'
		dest=File.open(path, "w+")
		##writing new data to the file test_data.txt
		source=File.open(project_path+'/error_codes/GETCOLLECTIONPOINTADDRESS/'+file+'.txt')
		IO.copy_stream(source, dest)
		puts IO.read(path)
	end

end