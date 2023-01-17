require_relative 'scraper'
# Step 1 - Only Looping
# 0. ✅ display a welcome message to the user
# 1. ✅ display the actions to the user
# 2. ✅ get the user's acxtion (store in a variable called 'action')
# 3. ✅ we need a condition to check the user's action
# 4. ✅ display a message for each action
######
# 5. ✅ Start the loop before asking for an action
# until the user says quit for the 'action'

def display_list(gift_list) # gift_list -> hash
  gift_list.each_with_index do |(item, bought), index|
    x_mark = bought ? 'X' : ' '
    puts "#{index + 1} - [#{x_mark}] #{item}"
  end
end

# 'item' => bought
gift_list = {
  'ps5' => false,
  'watch' => true
}
puts "--------------------------"
puts "----🎄Xmas Gift List🎄-----"
puts "--------------------------"
action = nil
until action == 'quit'
  puts 'Which action [list|add|mark|idea|delete|quit]?'
  action = gets.chomp

  case action
  when 'list'
    # Display our gifts here 👇
    # 0. iterate over the gift_list to display each gift
    # hash.each_with_index do |(key, value), index|
    # ex: "1 - [ ] sockets"
    # ex: "1 - [X] sockets" => if bought, then display X
    display_list(gift_list)
  when 'add'
    # Add a gift here 👇
    # 0. Ask the user what item they would like to add
    puts 'What item do you want to add?'
    # 1. Get the item from the user (store in 'item' variable)
    item = gets.chomp
    # 2. Add the item into the gift_list => hash[key] = value
    gift_list[item] = false
    # 3. Tell user the item was added into the list
    puts "#{item.capitalize} was added to your list!"
  when 'delete'
    # Delete a gift here
    # 0a. Display the gift_list
    display_list(gift_list)
    # 0. Ask user which 'index' they want to delete
    puts 'Which number would you like to delete?'
    # 1. store the 'index' in a variable and get it from the user
    #### gets.chomp -> convert to integer then subtract 1
    index = gets.chomp.to_i - 1
    # 2. we need to the item (aka the key) with the index ?????
    items = gift_list.keys
    item = items[index]
    # 3. remove the item from the gift_list -> hash.delete(key)
    gift_list.delete(item)
    # 4. Tell user the item was removed
    puts "#{item.capitalize} was removed from the list."
  when 'mark'
    # Mark a gift as 'bought' here 👇
    # 0a. Display the gift_list
    display_list(gift_list)
    # 0. Ask user which 'index' they want to mark as bought
    puts 'Which number would you like to mark?'
    # 1. store the 'index' in a variable and get it from the user
    #### gets.chomp -> convert to integer then subtract 1
    index = gets.chomp.to_i - 1
    # 2. we need to the item (aka the key) with the index ?????
    items = gift_list.keys
    item = items[index]
    # 3. update the item in the list to 'bought' -> hash[key] = new_value
    # gift_list[item] = !gift_list[item]
    gift_list[item] = true
    # 4. Tell user the item was updated
    puts "#{item.capitalize} was updated."
  when 'idea'
    # Add Etsy logic here
    # 0. Ask user what they want to search for
    puts "What do want to search for?"
    # 1. get the user's keyword (gets.chomp)
    keyword = gets.chomp
    # 2. call the scrape_etsy method and pass in the keyword as an argument
    #### scrape_etsy should return a hash
    # 3. store the hash in a variable
    etsy_items = scrape_etsy(keyword)
    # 4. give that hash to the display_list method
    display_list(etsy_items)
    # 5. Ask user which item they want to add
    puts 'What number do you want to add?'
    # 6. store the 'index' in a variable and get it from the user
    #### gets.chomp -> convert to integer then subtract 1
    index = gets.chomp.to_i - 1
    # 7. ask the etsy_list for all the keys
    items = etsy_items.keys
    # 8. get the one item from the keys using the index
    item = items[index]
    # 9. add that item into our gift_list -> hash[key] = false
    gift_list[item] = false
    puts "#{item} was added to the list"
  when 'quit'
    puts 'Byebye'
  else
    puts 'Wrong action'
  end
end
