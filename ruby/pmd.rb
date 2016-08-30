#!/usr/bin/env ruby
run_mins = 25
sleep_mins = 5
cycle = 0

while true
	puts Time.now
	cycle += 1
	puts "Cycle = #{cycle}"
	time_left_sec = run_mins*60
	sample_size = (2..5).to_a.sample
	reminder_mins = (1..run_mins).to_a.sample(sample_size).map {|m| m*60}

	`say start`
	while time_left_sec > 0
		ding = reminder_mins.index(time_left_sec)
		if ding
			`say work`
			print "+ "
		else
			print "#{time_left_sec/60} "
		end
		sleep 60
		time_left_sec -= 60
	end

	# Append to log file. Time stamp logged to a file. Each entry means success.
	`echo $(date "+%Y-%m-%d.%H:%M:%S") >> ~/reports/pmd-$(date "+%Y-%m-%d").log`

	time_left_sec = sleep_mins*60	
	`say relax`
	while time_left_sec > 0
		print "z "
		sleep 60
		time_left_sec -= 60
	end

	puts ""
end
