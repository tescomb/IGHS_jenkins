dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.expand_path(File.join(dir, 'httparty'))
require 'pp'
require 'selenium-webdriver'
=begin
# You can also use post, put, delete, head, options in the same fashion
response = HTTParty.get('https://api.stackexchange.com/2.2/questions?site=stackoverflow')
puts response.body, response.code, response.message, response.headers.inspect
=end

# An example post to a minimal rails app in the development environment
# Note that "skip_before_filter :verify_authenticity_token" must be set in the
# "pears" controller for this example

class Partay
	include HTTParty


	attr_accessor :access_token, :token_type, :status_info, :status_code, :deliveryslotid, :virtual_store_id, :post_code, :collection_id, :contract_id, :sorted_z_a, :sorted_a_z, :fav_count, :fav_prod_count, :total_search_count, :product_list_name, :amend_mode, :cc_hd_info, :order_size_pending, :slot_booked_info, :nickname, :postcode
	#$url='http://212.140.177.75'
	$url='http://mobile.tesco.com'


	def login_token(access_token, token_type, status_code, status_info)
		self.access_token = access_token
		self.token_type = token_type
		self.status_code = status_code
		self.status_info = status_info
	end



	def profile(amend_mode)
		self.amend_mode=amend_mode
	end



	def slot_info(cc_hd_info, slot_booked_info)
		self.cc_hd_info=cc_hd_info
		self.slot_booked_info=slot_booked_info
	end



	def pending_order_count(order_size_pending)
		self.order_size_pending=order_size_pending
	end



	# @return [Object]
	def slot_id(deliveryslotid)
		self.deliveryslotid=deliveryslotid
	end



	def product_name_list(product_list_name)
		self.product_list_name=product_list_name
	end



	def total_product_count(total_search_count)
		self.total_search_count=total_search_count
	end



	def favourite_count(fav_count)
		self.fav_count=fav_count
	end



	def favoutire_product_count(fav_prod_count)
		self.fav_prod_count=fav_prod_count
	end



	def sorted_Z_A(sorted_z_a)
		self.sorted_z_a=sorted_z_a
	end



	def sorted_A_Z(sorted_a_z)
		self.sorted_a_z=sorted_a_z
	end



	def virtual_store(virtual_store_id)
		self.virtual_store_id=virtual_store_id
	end



	def post_code_id(post_code)
		self.post_code=post_code
	end



	def collection_slot_id(collection_id)
		self.collection_id=collection_id
	end



	def order_number(contract_id)
		self.contract_id=contract_id
	end



	#mobile.tesco.com
	#194.72.84.230
	#	username: 'giri@dbt.com',
	#	password: 'qwerty'

	@@credentails=ENV['LOGIN'].split(':')



	def login_access
		options = {
				body: {
						client_secret: '0ujRTU8FlFnyfad11Ium',
						client_id: 'ECD515042FF417663A05',
						grant_type: 'password',
						username: @@credentails[0],
						password: @@credentails[1]
				}
		}
		response = Partay.post($url+'/groceryapi/RESTService.aspx?command=token&Version=2.0', options)
		if response.success?
			self.login_token(JSON(response)["access_token"], JSON(response)["token_type"], JSON(response)["StatusCode"], JSON(response)["StatusInfo"])
		else
			raise 'exception'
		end

	end



	def profile_state
		response=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=LISTBASKETSUMMARY&sessionkey='+access_token+'&version=2.0')
		puts response
		self.profile(JSON(response)["InAmendOrderMode"])
	end



	def get_choosen_slot
		slot_cc_hd=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=GETCHOSENSLOTINFO&sessionkey='+access_token+'&version=2.0&SURCHARGEMSG=Y')
		puts slot_cc_hd
		self.slot_info(JSON(slot_cc_hd)["IsClickAndCollect"], JSON(slot_cc_hd)["ChosenDeliverySlotInfo"])
	end



	def add_item
		response_search=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=PRODUCTSEARCH&searchtext=Sugar&page=1&sessionkey='+access_token+'&version=2.0')
		search_result=JSON(response_search)["Products"][0]["ProductId"]
		response_additem=Partay.get($url+'/groceryapi/restservice.aspx?COMMAND=CHANGEBASKET&sessionkey='+access_token+'&PRODUCTID='+search_result+'&CHANGEQUANTITY=1&version=2.0')
	end



	def book_a_slot_homedelivery
		base_url='http://mobile.tesco.com/groceryapi/RESTService.aspx?'
		response_book_a_slot=Partay.get(URI.escape(URI.encode($url+'/groceryapi/RESTService.aspx?COMMAND=LISTDELIVERYSLOTS&sessionkey='+access_token+'&version=2.0&WEEKNO=2')))
		self.slot_id(JSON(response_book_a_slot)["DeliverySlots"][0]["DeliverySlotId"])
		response_choose_a_slot=Partay.get(URI.escape(URI.encode($url+'/groceryapi/RESTService.aspx?COMMAND=CHOOSEDELIVERYSLOT&sessionkey='+access_token+'&DELIVERYSLOTID='+deliveryslotid+'&version=2.0')))
	end



	def book_a_slot_click_and_collect
		response_collection_point=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=LISTCOLLECTIONPOINTS&sessionkey='+access_token+'&version=2.0')
		puts '****** response collection point'+ response_collection_point
		self.virtual_store(JSON(response_collection_point)["CollectionPoints"][0]["VirtualStoreID"])

		response_post_code=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=DEFAULTDELIVERYADDRESS&sessionkey='+access_token+'&version=2.0')
		self.post_code_id(JSON(response_post_code)["Postcode"])

		response_list_collection_slot=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=LISTCOLLECTIONSLOTS&sessionkey='+access_token+'&version=2.0&virtualstoreid='+virtual_store_id+'&PostCode='+post_code+'&WEEKNO=2')

		self.collection_slot_id(JSON(response_list_collection_slot)["CollectionSlots"][0]["CollectionSlotID"])

		response_choose_collection_slot=Partay.get(URI.escape(URI.encode($url+'/groceryapi/RESTService.aspx?COMMAND=CHOOSECOLLECTIONSLOT&sessionkey='+access_token+'&version=2.0&CollectionSlotId='+collection_id+'&virtualstoreid='+virtual_store_id+'&PostCode='+post_code)))
		puts response_choose_collection_slot
	end



	def empty_basket
		response_empty_backet=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=EMPTYBASKET&sessionkey='+access_token+'&version=2.0')
	end



	def pending_order_size
		response_get_order=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=LISTPENDINGORDERS&sessionkey='+access_token+'&version=2.0')
		self.pending_order_count(JSON(response_get_order)["PendingOrders"].size)
	end



	def   cancel_pending_order
		response_get_order=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=LISTPENDINGORDERS&sessionkey='+access_token+'&version=2.0')
		#puts response_get_order
		if JSON(response_get_order)["PendingOrders"].empty?
			puts 'No Pending orders'
		else
			count=JSON(response_get_order)["PendingOrders"].size
			count.times do |i|
				self.order_number(JSON(response_get_order)["PendingOrders"][i]["OrderNumber"])
				response_cancel_order=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=CANCELORDER&contractId='+contract_id+'&sessionkey='+access_token+'&version=2.0')
			end
		end

	end



	def cancel_one_pending_order
		response_get_order=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=LISTPENDINGORDERS&sessionkey='+access_token+'&version=2.0')
		puts response_get_order

		if JSON(response_get_order)["PendingOrders"].empty?
			puts 'No Pending orders'
		else
			count=JSON(response_get_order)["PendingOrders"].size-2
			count.times do |i|
				self.order_number(JSON(response_get_order)["PendingOrders"][i]["OrderNumber"])
				response_cancel_order=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=CANCELORDER&contractId='+contract_id+'&sessionkey='+access_token+'&version=2.0')
			end
		end
	end



	def amend_order
		response_get_order=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=LISTPENDINGORDERS&sessionkey='+access_token+'&version=2.0')
		if JSON(response_get_order)["PendingOrders"].empty?
			puts 'No Pending orders'
		else
			self.order_number(JSON(response_get_order)["PendingOrders"][0]["OrderNumber"])
			response_amend_order=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=AMENDORDER&ORDERNUMBER='+contract_id+'&sessionkey='+access_token+'&version=2.0&SURCHARGEMSG=Y')
		end

	end



	def sort_by_a_z
		response_get_fav_list=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=LISTFAVOURITES&sessionkey='+access_token+'&page=1&version=2.0&SORTBY=Alphabetical+A-Z')
		#@@response_sorted_z_a=JSON(response_get_fav_list)["Products"].sort_by { |hash| hash['Name'] }
		@@response_sorted_a_z=JSON(response_get_fav_list)["Products"]
		count=3
		@@sorted_names_a_z=Array.new
		count.times { |i|
			@@sorted_names_list=@@response_sorted_a_z[i]['Name']
			if @@sorted_names_list.include? 'UNAVAILABLE:'
				@@sorted_names_list.to_s
				@@sorted_names_list.slice! "UNAVAILABLE:"
				@@sorted_names_a_z.push @@sorted_names_list.strip
			elsif @@sorted_names_list.include? 'WHY NOT TRY:'
				@@sorted_names_list.to_s
				@@sorted_names_list.slice! "WHY NOT TRY:"
				@@sorted_names_a_z.push @@sorted_names_list.strip
			else
				@@sorted_names_a_z.push @@sorted_names_list.strip
			end
		}
		self.sorted_A_Z(@@sorted_names_a_z)
	end



	def sort_by_z_a
		response_get_fav_list=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=LISTFAVOURITES&sessionkey='+access_token+'&page=1&version=2.0&SORTBY=Alphabetical+Z-A')
		#@@response_sorted_z_a=JSON(response_get_fav_list)["Products"].sort_by { |hash| hash['Name'] }
		@@response_sorted_z_a=JSON(response_get_fav_list)["Products"]
		count=3
		@@sorted_names_z_a=Array.new
		count.times { |i|
			@@sorted_names_list=@@response_sorted_z_a[i]['Name']
			if @@sorted_names_list.include? 'UNAVAILABLE:'
				@@sorted_names_list.to_s
				@@sorted_names_list.slice! "UNAVAILABLE:"
				@@sorted_names_z_a.push @@sorted_names_list
			elsif @@sorted_names_list.include? 'WHY NOT TRY:'
				@@sorted_names_list.to_s
				@@sorted_names_list.slice! "WHY NOT TRY:"
				@@sorted_names_z_a.push @@sorted_names_list
			else
				@@sorted_names_z_a.push @@sorted_names_list
			end
		}
		self.sorted_Z_A(@@sorted_names_z_a)
	end



	def favourites
		favourites_cnt = Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=LISTFAVOURITES&sessionkey='+access_token+'&page=1&version=2.0')
		if favourites_cnt.success?
			self.favourite_count(JSON(favourites_cnt)["TotalProductCount"])
		else
			raise "response failed"
		end
		if fav_count >= 1
			puts "Your favourites count is:#{fav_count}"
		else
			raise "There are no products in your favourites list."
		end
	end



	def favourites_assertion
		favourites_cnt = Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=LISTFAVOURITES&sessionkey='+access_token+'&page=1&version=2.0')
		if favourites_cnt.success?
			self.favourite_count(JSON(favourites_cnt)["PageProductCount"])
			self.favoutire_product_count(JSON(favourites_cnt)["Products"].count.to_i)
		else
			raise "response failed"
		end
		if fav_count >= 1
			puts "Your favourites count is:#{fav_count}"
		else
			raise "There are no products in your favourites list."
		end
	end



	def addrress_slot_change
		adrs_cng = Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=CHANGEDELIVERYADDRESS&sessionkey='+access_token+'&version=2.0&newaddressid=1')
		list_adrs = Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=LISTDELIVERYADDRESSES&sessionkey='+access_token+'&version=2.0')
		puts JSON(list_adrs)
		if list_adrs.success?
			address_id = JSON(list_adrs)["DeliveryAddresses"][0]["AddressID"]
			address_change = Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=CHANGEDELIVERYADDRESS&sessionkey='+access_token+'&version=2.0&newaddressid='+address_id+'')
		else
			raise 'failed'
		end

	end



	def get_searchproduct_count_anonymous
		response_search_product=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=PRODUCTSEARCH&searchtext=sugar&page=1&isanonymous=Y&version=2.0')
		self.total_product_count(JSON(response_search_product)["TotalProductCount"])

	end



	def get_searchproduct_count
		response_search_product=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=PRODUCTSEARCH&searchtext=Sugar&page=1&sessionkey='+access_token+'&version=2.0')
		self.total_product_count(JSON(response_search_product)["TotalProductCount"])
	end



	def get_search_product_list
		response_search_product=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=PRODUCTSEARCH&searchtext=Sugar&page=1&sessionkey='+access_token+'&version=2.0')

		@@product_list=Array.new
		3.times do
			@@count ||=0
			product_name=JSON(response_search_product)["Products"][@@count]["Name"]
			@@product_list.push product_name
			@@count += 1
		end
		self.product_name_list(@@product_list)
	end



	def cancel_amend_mode
		adrs_cng = Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=CANCELAMENDORDER&sessionkey='+access_token+'&version=2.0')
	end



	def add_item_value_twenty_five
		base_url=$url+'/groceryapi/RESTService.aspx?COMMAND=CHANGEBASKET&sessionkey='+access_token+'&PRODUCTID=&CHANGEQUANTITY=0&version=2.0&SURCHARGEMSG=Y&GETLINEITEMS=Y&MULTIADD=Y&PRODUCTIDSWITHQUANTITIES=281426090~25'
		puts base_url
		Partay.get(URI.escape(base_url))
	end



	def add_item_missed_promotion
		response_additem=Partay.get($url+'/groceryapi/restservice.aspx?COMMAND=CHANGEBASKET&sessionkey='+access_token+'&PRODUCTID=259373535&CHANGEQUANTITY=1&version=2.0')
	end



	def add_item_rdg_message
		response_additem=Partay.get($url+'/groceryapi/restservice.aspx?COMMAND=CHANGEBASKET&sessionkey='+access_token+'&PRODUCTID=257932908&CHANGEQUANTITY=1&version=2.0')
				#response_additem=Partay.get($url+'/groceryapi/restservice.aspx?COMMAND=CHANGEBASKET&sessionkey='+access_token+'&PRODUCTID=279705367&CHANGEQUANTITY=1&version=2.0')
	end



	def add_item_multiple(count)
		response_search=Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=PRODUCTSEARCH&searchtext=Sugar&page=1&sessionkey='+access_token+'&version=2.0')
		count_product=count
		@@base_url=$url+'/groceryapi/RESTService.aspx?COMMAND=CHANGEBASKET&sessionkey='+access_token+'&PRODUCTID=&CHANGEQUANTITY=0&version=2.0&SURCHARGEMSG=Y&GETLINEITEMS=Y&MULTIADD=Y&PRODUCTIDSWITHQUANTITIES'
		@@product_id_list=Array.new
		count_product.to_i.times do |i|
			search_result=JSON(response_search)["Products"][i]["ProductId"]
			@@product_id_list.push search_result
		end
		#puts @@product_id_list
		@amend_prod_count='~1|'
		@amended_string='='
		count_product.to_i.times do |i|
			@amended_string=@amended_string + @@product_id_list[i]
			@amended_string = @amended_string + @amend_prod_count
		end
		@amended_string.chop!
		@@base_url=@@base_url+@amended_string
		#puts @@base_url
		Partay.get(URI.escape(@@base_url))
	end



	def check_out
		begin
			puts 'opening the browser'
			@@driver = Selenium::WebDriver.for :safari
			@@driver.navigate.to "https://m.tesco.com/h5/groceriestabletapp/ipad/securelogin?"
			username = @@driver.find_element(:id, 'loginID')
			credentails=ENV['LOGIN'].split(':')
			username.send_keys credentails[0]
			password=@@driver.find_element(:id, 'password')
			password.send_keys credentails[1]
			sleep(2)
			@@driver.find_element(:id, 'confirm').click
			# wait for a specific element to show up
			wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
			wait.until { @@driver.find_element(:name => 'proceedToPayment') }
			@@driver.find_element(:name, 'proceedToPayment').click
			wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
			wait.until { @@driver.find_element(:name => 'cardNumber') }
			@@driver.find_element(:xpath,".//*[@id='cardNumber-0']").clear
			@@driver.find_element(:xpath,".//*[@id='cardNumber-0']").send_keys '4444333322221111'
			wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
			wait.until { @@driver.find_element(:name => 'securityCode') }
			@@driver.find_element(:id, 'securityCode-0').send_keys '123'
			@@driver.find_element(:id, 'submitButtons').location_once_scrolled_into_view
			sleep(2)
			@@driver.find_element(:xpath, ".//*[@id='submitButtons']/div/div[1]/input").click
			sleep(15)
			puts 'checkout completed'
			@@driver.quit
		rescue
			@@driver.quit
			puts 'in rescue block execution'
			puts 'opening the browser'
			@@driver = Selenium::WebDriver.for :safari
			driver.navigate.to "https://m.tesco.com/h5/groceriestabletapp/ipad/securelogin?"
			username = driver.find_element(:id, 'loginID')
			credentails=ENV['LOGIN'].split(':')
			username.send_keys credentails[0]
			password=driver.find_element(:id, 'password')
			password.send_keys credentails[1]
			driver.find_element(:id, 'confirm').click
			# wait for a specific element to show up
			wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
			wait.until { driver.find_element(:name => 'proceedToPayment') }
			driver.find_element(:name, 'proceedToPayment').click
			wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
			wait.until { driver.find_element(:name => 'cardNumber') }
			driver.find_element(:xpath,".//*[@id='cardNumber-0']").clear
			driver.find_element(:xpath,".//*[@id='cardNumber-0']").send_keys '4444333322221111'
			wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
			wait.until { driver.find_element(:name => 'securityCode') }
			driver.find_element(:id, 'securityCode-0').send_keys '123'
			driver.find_element(:id, 'submitButtons').location_once_scrolled_into_view
			sleep(2)
			driver.find_element(:xpath, ".//*[@id='submitButtons']/div/div[1]/input").click
			sleep(15)
			puts 'checkout completed in rescue block'
			driver.quit
		end
	end



	def deliveryaddress
		response_address= Partay.get($url+'/groceryapi/RESTService.aspx?COMMAND=defaultdeliveryaddress&sessionkey='+access_token+'&version=2.0')
		self.address_info(JSON(response_address)["Nickname"], JSON(response_address)["Postcode"])
	end



	def address_info(nickname, postcode)
		self.nickname=nickname
		self.postcode=postcode
	end



	def check_out_ops
		begin
			puts 'opening the browser'
			@@driver = Selenium::WebDriver.for :safari
			@@driver.navigate.to "https://uat-tesco-avocado-ops.usdk.net/mt/secure.tesco.com/register/default.aspx?from=https%3a%2f%2fsecure.tesco.com%2fgroceries%2fcheckout%2fdefault.aspx%3freviewed%3dno&un_jtt_application_platform=android"
			username = @@driver.find_element(:id, 'loginID')
			credentails=ENV['LOGIN'].split(':')
			username.clear
			username.send_keys credentails[0]
			password=@@driver.find_element(:id, 'password')
			password.clear
			password.send_keys credentails[1]
			sleep(2)
			@@driver.find_element(:id, 'un_bluebtn').click
			# wait for a specific element to show up
			wait = Selenium::WebDriver::Wait.new(:timeout => 60) # seconds
			wait.until { @@driver.find_element(:xpath, "//*[@id='checkout']/div[1]/div[1]/div[1]/div") }
			@@driver.find_element(:xpath, ".//*[@id='nextStage']").location_once_scrolled_into_view
			@@driver.find_element(:name, 'proceedToPayment').click
			wait = Selenium::WebDriver::Wait.new(:timeout => 60) # seconds
			wait.until { @@driver.find_element(:name => 'securityCode') }
			@@driver.find_element(:xpath, ".//*[@id='fOrder']/div/div[3]/div[1]/div/div[2]/div[1]/div[4]/div[2]/input").send_keys '123'
			@@driver.find_element(:xpath, ".//*[@id='fOrder']/div/div[4]").location_once_scrolled_into_view
			sleep(2)
			@@driver.find_element(:xpath, ".//*[@id='fOrder']/div/div[4]/input").click
			sleep(15)
			puts 'checkout completed'
			@@driver.quit
		rescue
			@@driver.quit
			puts 'in rescue block execution'
			puts 'opening the browser'
			driver = Selenium::WebDriver.for :safari
			driver.navigate.to "https://uat-tesco-avocado-ops.usdk.net/mt/secure.tesco.com/register/default.aspx?from=https%3a%2f%2fsecure.tesco.com%2fgroceries%2fcheckout%2fdefault.aspx%3freviewed%3dno&un_jtt_application_platform=android"
			username = @@driver.find_element(:id, 'loginID')
			credentails=ENV['LOGIN'].split(':')
			username.send_keys credentails[0]
			password=@@driver.find_element(:id, 'password')
			password.send_keys credentails[1]
			sleep(2)
			driver.find_element(:id, 'un_bluebtn').click
			# wait for a specific element to show up
			wait = Selenium::WebDriver::Wait.new(:timeout => 120) # seconds
			wait.until { @@driver.find_element(:xpath, "//*[@id='checkout']/div[1]/div[1]/div[1]/div") }
			driver.find_element(:xpath, ".//*[@id='nextStage']").location_once_scrolled_into_view
			driver.find_element(:name, 'proceedToPayment').click
			wait = Selenium::WebDriver::Wait.new(:timeout => 120) # seconds
			wait.until { @@driver.find_element(:name => 'securityCode') }
			driver.find_element(:xpath, ".//*[@id='fOrder']/div/div[3]/div[1]/div/div[2]/div[1]/div[4]/div[2]/input").send_keys '123'
			driver.find_element(:xpath, ".//*[@id='fOrder']/div/div[4]").location_once_scrolled_into_view
			sleep(2)
			driver.find_element(:xpath, ".//*[@id='fOrder']/div/div[4]/input").click
			sleep(15)
			puts 'checkout completed'
			driver.quit
		end
	end
end
