#!/usr/bin/env ruby

min = 15
max = 15
total = 0
count = 0

Dir.foreach('./bestiary/_posts/') do |path|
  next if path == '.' or path == '..'
  
  path = './bestiary/_posts/' + path

  file = File.open(path, 'r')
  file.each_line do |line|
    if line.include? "Armor Class"
      ac = line[/([0-9]{1,2})/, 1].to_i
      total += ac
      count += 1
      if ac < min
        min = ac
      end
      if ac > max
        max = ac
      end
    end
  end
  file.close
end

mean = total / count

puts "Maximum: " + max.to_s
puts "Minimum: " + min.to_s
puts "Mean: " + mean.to_s
