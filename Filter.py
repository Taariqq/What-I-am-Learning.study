# use a hashtable to filter out duplicate items


# define a set of items that we want to reduce duplicates
items = ["apple", "pear", "orange", "banana", "apple",
         "orange", "apple", "pear", "banana", "orange",
         "apple", "kiwi", "pear", "apple", "orange"]

# TODO: create a hashtable to perform a filter
filter = dict()
print("filter is: ", filter)
print("items now: ", items)

# TODO: loop over each item and add to the hashtable
for key in items:
  filter[key] = 0
  
print("items at loop: ", items)

# TODO: create a set from the resulting keys in the hashtable
result = set(filter.keys())
print(result)