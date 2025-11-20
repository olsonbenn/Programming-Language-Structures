# MyToken.rb
# Authors: Logan Bratonja and Bennett Olson

class MyToken
  def initialize(type, text)
    @type = type
    @text = text
  end

  #define token types

  WHILE = 0

  INTEGER = 1
  STRING = 2

  EQUALS = 3
  LESS_THAN = 4
  GREATER_THAN = 5
  NOT_EQUALS = 6

  PLUS = 7
  MINUS = 8
  MULT = 9
  DIV = 10

  LEFT_PAR = 11
  RIGHT_PAR = 12
  LEFT_BRACKET = 13
  RIGHT_BRACKET = 14
  SEMICOLON = 15

  EOF = -1
  INVALID = -99
end

