#!/usr/bin/env ruby

min = 15
max = 15
total = 0

Dir.foreach('./bestiary/_posts/') do |path|
  next if path == '.' or path == '..'
  
  path = './bestiary/_posts/' + path

  file = File.open(path, 'r')
  file.each_line do |line|
    if line.include? "Armor Class"
      puts line[/([0-9]{1,2})/, 1]
    end
  end
  file.close
end
