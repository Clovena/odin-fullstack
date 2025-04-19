# Devices
#
# Here we are talking about the filepaths known as
# stdin
# stdout
# stderr
#
# These are located within `/dev` on macOS
#
# Standard input (/dev/fd/0)
# Standard output (/dev/fd/1)
# Standard error (/dev/fd/2)

# Ruby contains a Class that allows interaction with these streams.
#
# The global variables $stdin, $stdout, and #stderr
# point to their respective constants.
# $stdin is read-only, and $stdout and $stderr are write-only.
#
$stdout.puts 'Hello world!'
# This is longhand for the more familiar
puts 'Hello world!'

# To create a new IO object in Ruby, a file descriptor (fd) is required.
io = IO.new(1) # The 1 here indicates stdout
io.puts 'Hello world!'
# io = IO.new
# with no arguments in new() will throw an error

# IO objects to other streams beyond 0, 1, 2
# require the file descriptor to be obtained,
# since they don't have constant descriptors.
fd = IO.sysopen('/dev/null', 'w+')
# => 6
# fd is used here to stand for "file descriptor"
dev_null = IO.new(fd)
# this /dev/null is called the black hole or bit bucket,
# and it serves as the null device on Unix-like systems.
# Writing to it does nothing, and attempting to read from it returns nothing (nil)
dev_null.puts 'Hello world' # => nil
dev_null.gets # => nil
dev_null.close # => nil

# IO streams can be opened to a text file just the same as a device (above).
# To do so:
# 1. Create a file descriptor with the path to the file
# 2. Create an IO object for that fd
# 3. Interact with the IO stream as necessary
# 4. Close the file when work is finished
