file = File.open("input.txt")
file_data = file.read
file.close
pattern = /mul\((\d{1,3}),(\d{1,3})\)|(don't\(\))|(do\(\))/
matches = file_data.scan(pattern)
domath = true
products = matches.map do |pair|
  if pair[3] == "do()"
    domath = true
  elsif pair[2] == "don't()"
    domath = false
  elsif domath
    pair[0].to_i * pair[1].to_i
  end
end
sum = 0
products.each do |product|
  if product.is_a?(Integer)
    sum += product
  end
end
p sum

