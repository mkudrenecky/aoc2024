def read_file (filepath)
  file = File.open(filepath)
  file_data = file.readlines
  file.close
  rules = Hash.new
  updates = Array.new
  file_data.each do |line|
    if line.include?("|")
      key, rule = line.split("|")
      rules[key.to_i] = [] unless rules[key.to_i]
      rules[key.to_i] << rule.to_i
    else
      updates << line.split(",").map(&:to_i)
    end
  end
  [rules, updates]
end

def correct_updates(rules, updates)
  good_updates = []
  bad_updates = []
  updates.each do |update|
    is_good = true
    update.each_with_index do |value, index|
      if rules[value]
        head = update[0...index]
        if rules[value].any? { |rule| head.include?(rule) }
          is_good = false
          bad_updates << update
          break
        end
      end
    end
    good_updates << update if is_good
  end
  [good_updates, bad_updates]
end

def sum_updates_middle_values(good_updates)
  sum = 0
  good_updates.each do |update|
    sum += update[update.size/2].floor
  end
  p sum
  sum
end

def re_order_updates(bad_updates, rules)
  bad_updates.each do |update|
    re_ordered = true

    while re_ordered
      re_ordered = false

      update.each_with_index do |value, index|
        if rules[value]
          head = update[0...index]
          violating_rule = rules[value].find { |rule| head.include?(rule) }

          if violating_rule
            swap_index = update.index(violating_rule)
            update[index], update[swap_index] = update[swap_index], update[index]
            re_ordered = true
          end
        end
      end
    end
  end

  bad_updates
end

