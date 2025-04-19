# IO Streams to files

fd = IO.sysopen('/Users/zjricker/repos/odin-fullstack/01-ruby/03_serialization/lorem.txt')
lorem = IO.new(fd)
lorem.gets
# => "Lorem ipsum\n"
# Note that the gets method reads and returns the first line of the file
# and then moves the "cursor" to the start of the next line.
lorem.pos # pos returns the cursor POSition
# => 12
lorem.gets # => "dolor\n"
lorem.gets # => "sit amet...\n"
lorem.pos # => 30
lorem.gets # => nil
# (we have reached the end of the file)
lorem.eof? # => true
lorem.rewind # Moves the cursor back to the beginning of the file
lorem.pos # => 0

fd = IO.sysopen('/Users/zjricker/repos/odin-fullstack/01-ruby/03_serialization/test.txt', 'w+')
# Here, a new file is created (test.txt was not created beforehand).
# w+ indicates creation of a file for read-write access
# Full list of open modes below:
#
# "r"  Read-only, starts at beginning of file  (default mode).
# "r+" Read-write, starts at beginning of file.
# "w"  Write-only, truncates existing file
#      to zero length or creates a new file for writing.
# "w+" Read-write, truncates existing file to zero length
#      or creates a new file for reading and writing.
# "a"  Write-only, each write call appends data at end of file.
#      Creates a new file for writing if file does not exist.
# "a+" Read-write, each write call appends data at end of file.
#      Creates a new file for reading and writing if file does
#      not exist.
# src: https://ruby-doc.org/core-2.7.1/IO.html#method-c-new-label-IO+Open+Mode
#
# Anyway...
io = IO.new(fd) # for test.txt
io.puts 'Hello world'
io.puts 'Goodbye world'
# Two lines have been written to test.txt
io.gets # => nil
io.eof? # => true
# When we write to a file, the cursor is placed after the line written.
# In order to read the file, we must first rewind.
io.rewind
io.gets # => "Hello world\n"
# Operations midstream will overwrite data, NOT insert.
io.puts 'Middle'
io.rewind
io.read # => "Hello world\nMiddle\n world\n"
