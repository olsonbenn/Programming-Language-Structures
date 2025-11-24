# main.rb
# Authors: Logan Bratonja and Bennett Olson
# This is the main class for Project Task 3 (Lexer), which was provided by the instructor.
# The only modification is the commented out line used for input files when
# debugging.
# 

require_relative "MyLexer"

# Uncomment this line for debugging. Must place your_program.in with desired input
# in the lib folder of the project.

#$stdin.reopen("your_program.in")

lexer = MyLexer.new

t = lexer.next_token
# Had to change MyToken.EOF to MyToken.const_get('EOF') as EOF is a method call that can't be implemented due to
# Ruby regex method naming restrictions
while MyToken.const_get('EOF') != t.type do
  # Changed to t.display to format the output to something other than the memory address
  puts t.display
  # Had to change nextToken to next_token to match assignment naming conventions
  t = lexer.next_token
end

puts "Lexical analysis is finished!"
