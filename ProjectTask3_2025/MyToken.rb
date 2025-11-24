# MyToken.rb
# Authors: Logan Bratonja and Bennett Olson

class MyToken
  def initialize(type, text)
    @type = type
    @text = text
  end

  def display
    "Token type: #{const_to_name(@type)}, text: #{@text}"
  end

  def type
    @type
  end

  def const_to_name(value)
    case value
    when 0
      return "WHILE"
    when 1
      return "STRING"
    when 2
      return "INTEGER"
    when 3
      return "FLOAT"
    when 4
      return "EQUIVALENT"
    when 5
      return "LESS_THAN"
    when 6
      return "LESS_THAN_OR_EQUAL"
    when 7
      return "GREATER_THAN"
    when 8
      return "GREATER_THAN_OR_EQUAL"
    when 9
      return "NOT_EQUALS"
    when 10
      return "PLUS"
    when 11
      return "MINUS"
    when 12
      return "MULT"
    when 13
      return "DIV"
    when 14
      return "LEFT_PAR"
    when 15
      return "RIGHT_PAR"
    when 16
      return "LEFT_BRACKET"
    when 17
      return "RIGHT_BRACKET"
    when 18
      return "SEMICOLON"
    when -99
      return "INVALID"
    else
      return 'EOF'
    end
  end

  #define token types

  WHILE = 0

  STRING = 1
  INTEGER = 2
  FLOAT = 3


  EQUIVALENT = 4
  LESS_THAN = 5
  LESS_THAN_OR_EQUAL = 6
  GREATER_THAN = 7
  GREATER_THAN_OR_EQUAL = 8
  NOT_EQUALS = 9

  PLUS = 10
  MINUS = 11
  MULT = 12
  DIV = 13

  LEFT_PAR = 14
  RIGHT_PAR = 15
  LEFT_BRACKET = 16
  RIGHT_BRACKET = 17
  SEMICOLON = 18

  EOF = -1
  INVALID = -99
end

