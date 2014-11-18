puts 'in new file'
puts ARGV[0][0..9]
puts "reports_sanity-"+ARGV[0][0..9]+".html"
puts 'got the results'


logo='http://www.thegrocer.co.uk/Pictures/420xAny/3/1/0/43310_tesco_logo.jpg'
results_dir=File.expand_path("../Android_GHS_Sanity/results/", Dir.pwd)
#fileHtml = File.new(results_dir+'/'+"reports_sanity-"+ARGV[0][0..9]+".html", "w+")
fileHtml = File.new(results_dir+'/'+"reports_sanity-android_phone.html", "w+")
fileHtml.puts "<HTML><BODY BGCOLOR='white'> <CENTER><img src="+logo+" width=200 height=200 ALIGN='center'></CENTER>"
fileHtml.puts "<CENTER>TESCO APP MONITORING REPORTS FOR ANDROID PHONE</CENTER><br>"


ARGV.reverse!.each do|a|
	puts "Argument: #{a}"
	report_date=a[0..9]
	date_formatter=a.split("|")[0]
	url='http://mobileappmonitoring.site11.com/sanity_reports/android_phone/'+report_date+'/'+date_formatter+':phone_sanity.html'
	fileHtml.puts "<TABLE BORDER='1' ALIGN='center'>"
	if a.split("|")[1] == 'Pass'
		fileHtml.puts "<TR><TH><a href="+url+"><CENTER><FONT COLOR='green'>"+a+"</FONT></CENTER></a></TH>"
	else
		fileHtml.puts "<TR><TH><a href="+url+"><CENTER><FONT COLOR='red'>"+a+"</FONT></CENTER></a></TH>"
	end
end
fileHtml.puts "</TR></TABLE>"


=begin
fileHtml.puts "<TABLE BORDER='1' ALIGN='center'>"
fileHtml.puts "<TR><TH>HEADER</TH></TR>"
fileHtml.puts "<TR><TD>Cell in <FONT COLOR='RED'>TableThing</FONT></TD></TR>"
fileHtml.puts "</TABLE>"
fileHtml.puts "<TABLE BORDER='0' ALIGN='center'>"
fileHtml.puts "<TR><TH>HEADER on borderless</TH></TR>"
fileHtml.puts "<TR><TD>Cell in borderless<FONT COLOR='white'>TableThing</FONT></TD></TR>"
fileHtml.puts "</TABLE>"
=end
fileHtml.puts "</BODY></HTML>"
fileHtml.close()




