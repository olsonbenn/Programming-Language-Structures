# MyLexer.rb
# Authors: Logan Bratonja and Bennett Olson

class MyLexer

  def initialize
    @input = $stdin.gets.chomp
    @position = 0
    @current_token = @input[@position]
  end

  def next_token
    while @current_token.nil? == false

    end
  end
end