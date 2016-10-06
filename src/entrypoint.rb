###
# Sample Ruby Code
###

puts "Hello, here is example with cross compile mruby executable"
puts "I receive #{ARGC} arguments, and with fellow values: " if ARGC > 0
ARGV.each do |value|
  puts "* #{value}"
end
