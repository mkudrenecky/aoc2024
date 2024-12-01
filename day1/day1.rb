def list_distance(list1, list2)
  distance_list = list1.sort.each_with_index.map {|x, index| x=(x.to_i-list2.sort[index].to_i).abs}
  puts distance_list.reduce{|sum, distance| sum + distance}
end

def get_lists_from_file(file_path)
  file = File.open(file_path)
  list1 = Array.new
  list2 = Array.new
  file.each_line do |line|
    list1.push(line.split[0]) 
    list2.push(line.split[1])
  end
  file.close
  [list1, list2]
end
  
