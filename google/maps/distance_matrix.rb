def print_usage
	STDERR.puts "Usage: matrix.rb source_file dest_file [transit]"
end

def parse_options
	if ARGV.count == 2
		{
			source: ARGV[0],
			dest: ARGV[1],
			arrival: Time.new(2016,7,25,9,0,0),
			transit: false,
		}
	elsif ARGV.count == 3 && ARGV[2].downcase == "transit"
		{
			source: ARGV[0],
			dest: ARGV[1],
			arrival: Time.new(2016,7,25,9,0,0),
			transit: true,
		}
	else
		nil
	end
end

options = parse_options

if options == nil
	print_usage
	exit
end

STDERR.puts options

# require 'active_support/core_ext/some_class'
# ActiveSupport::CoreExtensions::Hash
require 'active_support/core_ext/hash'

def url oo,dd,t,is_transit
	o = oo.split(",").map {|y| y.strip.gsub(/\s/,"+") }.join(",")
	d = dd.split(",").map {|y| y.strip.gsub(/\s/,"+") }.join(",")

	# TODO Can I use all origins here and dest in single call?
	query_hash = {
		units: "imperial",
		origins: o,
		destinations: d,
		key: "Put Your API Key Here",
		arrival_time: t.to_i
	}

	query_hash[:mode] = "transit" if is_transit

	query = query_hash.to_query

	"https://maps.googleapis.com/maps/api/distancematrix/json?#{query}"
end

src = File.open(options[:source]).read
dst = File.open(options[:dest]).read

s1 = src.split("\n")
d1 = dst.split("\n")

require 'net/http'
require 'json'
require 'yaml'

grid = {}

# API limitation. Batch of 25x25 in 1 request. 2500 elements per day. Wow! API design, nice!
s1.each_slice(25) do |s|
	d1.each_slice(25) do |d|
		begin
			target_url = url(s.join("|"), d.join("|"), options[:arrival], options[:transit])
			STDERR.puts target_url
			#r = JSON.parse(File.open("t1").read)
			r = JSON.parse(Net::HTTP.get(URI(target_url)))

			if r["status"] != "OK"
				STDERR.puts "Error: Status response=#{r}"
				next
			end

			s.each_with_index  do |s_i, i|
				d.each_with_index  do |d_j, j|
					begin
						element = r["rows"][i]["elements"][j]
						if element["status"] != "OK"
							STDERR.puts "Error: Element not OK #{element}"
							grid[[s_i,d_j]] = nil
							next
						end

						grid[[s_i,d_j]] = [element["duration"]["value"], element["distance"]["value"]]
					rescue => e
						STDERR.puts "Error: Element src=#{s_i} dst=#{d_j} error=#{e}"
						grid[[s_i,d_j]] = nil 
					end
				end
				puts
			end
		rescue => e
			STDERR.puts "Error: Batch src=#{s} dst=#{d} error=#{e}"
		end
	end
end

puts "Source;" + d1.join(";")

s1.each do |s|
	print s + ";"
	line = []
	d1.each do |d|
		line << grid[[s,d]][0]
	end

	puts line.join(";")
end

# http://stackoverflow.com/questions/14532959/how-do-you-save-values-into-a-yaml-file
#d = YAML::load_file('/tmp/test.yml') #Load
#d['content']['session'] = 2 #Modify
File.open("grid#{Time.now.to_i}.yml", 'w') {|f| f.write grid.to_yaml } #Store

# TODO cache old responses
