def get_lists_from_file(file_path)
  file = File.open(file_path)
  list = Array.new
  file.each_line do |line|
    list.push(line.split.map(&:to_i))
  end
  file.close
  list
end

def sorted?(arr)
  arr.sort == arr || arr.sort.reverse == arr
end

def unique?(arr)
  arr.uniq == arr
end

def modest_increment?(arr)
  arr.each_with_index do |x, index|
    if index < arr.length-1
      if (x-arr[index+1]).abs > 3 
        return false
      end
    end
  end
  return true
end

def safe?(list)
  count = 0 
  list.each do |arr|
    if sorted?(arr) && unique?(arr) && modest_increment?(arr)
     count += 1
    end
  end
   count
end
