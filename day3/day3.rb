file = File.open("input.txt")
file_data = file.read
file.close
pattern = /mul\((\d{1,3})\,(\d{1,3})\)/
matches = file_data.scan(pattern)
products = matches.map do |pair|
   pair[0].to_i * pair[1].to_i
end
sum = products.reduce { |sum, product| sum += product }
p products
p matches
p sum
