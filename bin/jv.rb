
require File.dirname(__FILE__)+'/../lib/town'
if ARGV.size < 2
  puts "Please input all required inputs."
  exit
end

 jv = Town.new(ARGV.first)
 result = jv.search_low_price_restaurant(ARGV[1,ARGV.size-1])
 unless result.nil?
	     
	 puts "\n--Your order--"
	 puts ARGV[1,ARGV.size-1].join(',')
	 puts "--Result--"
	 puts result.print
	 
 end
