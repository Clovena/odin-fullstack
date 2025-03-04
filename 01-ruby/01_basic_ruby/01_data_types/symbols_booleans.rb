# Symbols are an interesting twist on strings.
# Strings can be changed, so every time a string is used,
# Ruby has to store it in memory even if an existing string with the same value already exists.
# Symbols, on the other hand, are stored in memory only once, making them faster in certain situations.

# Symbols are declared with a leading colon. See below.
:my_symbol

# The difference between symbols and strings can be demonstrated with the #object_id method.
"string" == "string" #=> true
"string".object_id == "string".object_id #=> false
# Here, the same string is stored in memory two different times,
# and each storage event is given its own object_id.

:symbol.object_id == :symbol.object_id #=> true


# Booleans
# In addition to true and false, Ruby has a third boolean value called nil. 
# nil is returned when a piece of code has nothing else to return. 
# In statements where a boolean is required, nil behaves like false. 