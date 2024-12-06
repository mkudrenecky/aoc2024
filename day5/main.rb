require_relative ("day5.rb")

rules, updates = read_file("input.txt")

good_updates, bad_updates = correct_updates(rules, updates)

sum_updates_middle_values(good_updates)

re_ordered_updates = re_order_updates(bad_updates, rules)
sum_updates_middle_values(re_ordered_updates)


