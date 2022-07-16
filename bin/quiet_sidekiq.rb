command = "ps -ef | grep sidekiq | grep app | grep -v grep | awk '{print $2}'"
puts "running [#{command}]"
pid = `#{command}`
if !pid.nil? && !pid.empty?
  term_command = "kill -TSTP #{pid}"
  puts "running [#{term_command}]"
  `#{term_command}`
end
