require 'csv'

puts "Parsing the file..."
# Open a CSV file:
# CSV.read("scIgnored.csv")
table = CSV.read(ARGV[0], headers: true)
puts ARGV[0]
# Do things to the file to reorganize it:
# Start a new table
newTable = [["Company Name", "Count of SC Clicks", "Count of Non-SC Clicks"]]


i = 0

loop do
  # Loop through the first category, add these to the table.
  if table[i][0].match('Count of Clicked Non-Smart Choice "Book" Button')
    # Add the company name and the count of non-smart choice clicks
    puts table[i][1]
    newTable << [table[i][1], 0, table[i][3]]
    # puts "Parsed a Non-SC book line"
  elsif table[i][0].match('Count of Clicked ANY Smart Choice Rate')
    # check for duplicate names in the newTable
    # puts "parsed an SC book line"
    x = 0
    for x in newTable do
      # puts "X = #{x[0]}"
      if x[0].match(table[i][2])
        puts "Found a match between #{x[0]} and #{table[i][2]}"
        # update that existing record
        x[1] = table[i][3]
      elsif x[0].match(table[i][2]) == false
        newTable << [table[i][2], table[i][3], 0]
      end
    end
  end
  # if it doesn't match the first category, loop through the other category.
  i += 1
  if i == table.size

    break
  end

end
puts "=================="
puts "=================="
puts newTable
File.write("newData.csv", newTable.map { |c| c.join(",") }.join("\n"))
