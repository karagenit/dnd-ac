#!/usr/bin/env ruby

def graphArray(array)
  array.each_with_index do |count, ac|
    printf "%02d|%s\n", ac, ('#' * count)
  end
end

min = 15
max = 15
total = 0
count = 0
acs = Array.new(30, 0)
raw = Array.new

Dir.foreach('./bestiary/_posts/') do |path|
  next if path == '.' or path == '..'
  
  path = './bestiary/_posts/' + path

  file = File.open(path, 'r')
  file.each_line do |line|
    if line.include? "Armor Class"
      ac = line[/([0-9]{1,2})/, 1].to_i
      total += ac
      count += 1
      acs[ac] += 1
      raw.push ac
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

puts "Counted: " + count.to_s
puts "Maximum: " + max.to_s
puts "Minimum: " + min.to_s
puts "Mean: " + mean.to_s
IO.write('ac_counts.txt', acs.to_s)
IO.write('ac_raw.txt', raw.to_s)
graphArray(acs)
