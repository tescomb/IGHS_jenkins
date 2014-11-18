#!/usr/bin/ruby -w

require 'rexml/document'
include REXML

Array report_time_stamp=Array.new
Array report_status=Array.new

xmlfile = File.new("/Users/saikrishna/Grocery_vso_git/Grocery-GHS-Android-Phone/Android_GHS_Sanity/results/TEST-features-sanity_load.xml")
xmldoc = Document.new(xmlfile)

# Now get the root element
root = xmldoc.root


=begin
puts ARGV[0]
report_time_stamp.push ARGV[0]
puts report_time_stamp.size
=end

if root.attributes["failures"].to_i >= 1
	report_status.push 'Fail'
	File.write('/Users/saikrishna/Grocery_vso_git/Grocery-GHS-Android-Phone/Android_GHS_Sanity/teststatus.txt','Fail')
elsif root.attributes["errors"].to_i >= 1
	report_status.push 'Fail'
	File.write('/Users/saikrishna/Grocery_vso_git/Grocery-GHS-Android-Phone/Android_GHS_Sanity/teststatus.txt','Fail')
else
	report_status.push 'Pass'
	File.write('/Users/saikrishna/Grocery_vso_git/Grocery-GHS-Android-Phone/Android_GHS_Sanity/teststatus.txt','Pass')

end

puts '&&*******'
fileHtml = File.new("fred11.html", "w+")
fileHtml.puts "<HTML><BODY BGCOLOR='green'>"
fileHtml.puts "<CENTER>this is neat</CENTER><br>"
puts 'sasasasa'
=begin
report_time_stamp.count.times do |i|
	fileHtml.puts "<CENTER><FONT COLOR='yellow'>"+report_time_stamp[i]+report_status[i]+"</FONT></CENTER>"
end
=end

f1 = File.open('/Users/saikrishna/Grocery_vso_git/Grocery-GHS-Android-Phone/Android_GHS_Sanity/data.txt', 'r')
f2 = File.open('/Users/saikrishna/Grocery_vso_git/Grocery-GHS-Android-Phone/Android_GHS_Sanity/teststatus.txt', 'r')

while line1 = f1.gets && line2 = f2.gets
	fileHtml.puts "<CENTER><FONT COLOR='yellow'>"+line1  +  line2+"</FONT></CENTER>"
end


fileHtml.puts "<TABLE BORDER='1' ALIGN='center'>"
fileHtml.puts "<TR><TH>HEADER</TH></TR>"
fileHtml.puts "<TR><TD>Cell in <FONT COLOR='RED'>TableThing</FONT></TD></TR>"
fileHtml.puts "</TABLE>"
fileHtml.puts "<TABLE BORDER='0' ALIGN='center'>"
fileHtml.puts "<TR><TH>HEADER on borderless</TH></TR>"
fileHtml.puts "<TR><TD>Cell in borderless<FONT COLOR='white'>TableThing</FONT></TD></TR>"
fileHtml.puts "</TABLE>"
fileHtml.puts "</BODY></HTML>"
fileHtml.close()

