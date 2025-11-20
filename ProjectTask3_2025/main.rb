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

t = lexer.nextToken

while MyToken.EOF != t.type do
  puts t
  t = lexer.nextToken
end

puts "Lexical analysis is finished!"
