

=begin
Array report_time_stamp=Array.new
Array report_status=Array.new

report_time_stamp = ARGV[0]
report_status = ARGV[1]
=end

results_dir=File.expand_path("../results/", Dir.pwd)
fileHtml = File.new("reports_sanity.html", "w+")
fileHtml.puts "<HTML><BODY BGCOLOR='green'>"
fileHtml.puts "<CENTER>this is neat</CENTER><br>"

puts '**** beforecount****'

puts '****count of array'

	fileHtml.puts "<CENTER><FONT COLOR='yellow'>"+'saaa'+'asasa'+"</FONT></CENTER>"
=begin

<tr>
<td width="131" height="29" class="gf">ssss</td>
    <td width="244">&nbsp;</td>
<td width="237">&nbsp;</td>
  </tr>
<tr>
<td height="34">&nbsp;</td>
    <td>&nbsp;</td>
<td>&nbsp;</td>
  </tr>
=end



fileHtml.puts "<TABLE BORDER='1' ALIGN=''>"
fileHtml.puts "<TR><TD>Android_Tablet</TD>"
=begin
fileHtml.puts "<TD width='244'>IPhone</TD>"
fileHtml.puts "<TD width='244'>Android_Phone</TD></TR>"
=end
10.times do
	fileHtml.puts "<TR><TD>Tablet results <FONT COLOR='RED'>TableThing</FONT></TD>"
end

=begin
fileHtml.puts "</TABLE>"


fileHtml.puts "<TABLE BORDER='1' ALIGN=''>"
=end
fileHtml.puts "<TR><TD width='244'>IPhone</TD>"
10.times do
	fileHtml.puts "<TR><TD>Tablet results <FONT COLOR='RED'>TableThing</FONT></TD></TR>"
end

fileHtml.puts "</TABLE>"


=begin
fileHtml.puts "<TABLE BORDER='1' ALIGN=''>"
fileHtml.puts "<TR><TH>HEADER</TH></TR>"
fileHtml.puts "<TR><TD>Cell in <FONT COLOR='RED'>TableThing</FONT></TD></TR>"
fileHtml.puts "</TABLE>"
=end


fileHtml.puts "</BODY></HTML>"
fileHtml.close()