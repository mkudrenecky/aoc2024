require_relative ("day5.rb")

rules, updates = read_file("input.txt")

good_updates = correct_updates(rules, updates)

sum_good_updates_middle_values(good_updates)
