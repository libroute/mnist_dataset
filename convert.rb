#!/usr/bin/env ruby

# Read labels and images files and produce csv output
require 'csv'

f = File.open('labels')
f2 = File.open('images')
fout = File.open('output.csv','wb')
magic,n_total = f.read(8).unpack('N*')
magic2, n_total2, nr, nc = f2.read(16).unpack('N*')
if n_total!=n_total2 then throw 'Inconsistent file sizes' end
puts "Found #{n_total} items"
(1..n_total).to_a.each do |idx|
  puts "#{idx} of #{n_total}" if idx % 1000 == 0
  truth = f.read(1).unpack('C')[0]
  im = f2.read(nr*nc).unpack('C*').map{|x| (x.to_f/255)}
  v = Array.new(10,0)
  v[truth] = 1
  fout.write v.concat(im).to_csv
end
f.close
f2.close
fout.close
