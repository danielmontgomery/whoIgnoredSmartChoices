require 'csv'

puts "Parsing the file..."
# Open a CSV file:
table = CSV.read(ARGV[0], headers: true)
puts ARGV[0]

# Clean up the table data:
# Remove Parentheses in company names, then remove special characters.
encoding_options = {
  :invalid => :replace,
  :undef => :replace,
  :replace => " ",
  :universal_newline => true #probably an unnecessary line for this script.
}

for i in table
  i[1] = i[1].tr("()", "")
  i[1] = i[1].encode(Encoding.find("ASCII"), encoding_options)
  i[2] = i[2].tr("()", "")
  i[2] = i[2].encode(Encoding.find("ASCII"), encoding_options)
end

# Start a new table
newTable = [["Company Name", "Count of SC Clicks", "Count of Non-SC Clicks", "Total"]]

for i in table do
  if i[0].match('Count of Clicked Non-Smart Choice "Book" Button')
    newTable << [i[1], 0, i[3]]

  elsif
    # check if there are matches for Company name.
    # If so, amend that row in newTable.
    # If not, make a new row in newTable.
    for x in newTable do
      if i[2].match(x[0]) && i[0].match('Count of Clicked ANY Smart Choice Rate')
        puts "match #{i[2]} and #{x[0]}"
        x[1] = i[3]
        break
      end
    end
    puts "no match for #{i[2]}"
    newTable << [i[2], i[3], 0]
  end
end

# add a column for total
for t in newTable do
  t[3] = t[1].to_i+t[2].to_i
end
newTable[0][3] = "Total"

puts newTable
puts "See newData.csv for the output"
File.write("newData.csv", newTable.map { |c| c.join(",") }.join("\n"))
