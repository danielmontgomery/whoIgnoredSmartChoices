# Who ignored Smart Choices?
Takes a CSV file from Heap and makes it easier to process in Excel.

# How to use it:
- This assumes you're on a Mac. If you're on Windows, make sure you have a way to run Ruby. 
- Check [here](https://www.thoughtco.com/using-the-command-line-2908368#targetText=Open%20a%20command%20line%20window,the%20command%20ruby%20test.rb.) for instructions on how to run programs or scripts from the command line.
- Download the CSV file from Heap for the report "Who is ignoring smart choices?"
- Save the rb file in the directory of your CSV download.
- in the command line in that directory, run:

      ruby csvParser.rb nameOfFile.csv
- Check that directory for the output file, which will also be named in the console output. The console output tells you all the matches and non-matches it identified as well.
