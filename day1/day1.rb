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

def similarity_score(list1, list2)
  similarity_scores = Array.new(list1.length, 0)
  list1.each_with_index do |x, index| 
    list2.each do |y|
      similarity_scores[index] += 1 if x == y 
    end
  end
 scores = similarity_scores.each_with_index.map { |x, index| x*list1[index].to_i }
 similarity_score = scores.reduce { |sum, score| sum + score }
 puts similarity_score
end

