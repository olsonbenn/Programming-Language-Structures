# MyLexer.rb
# Authors: Logan Bratonja and Bennett Olson
require_relative "MyToken"
class MyLexer

  # Initializes the class
  def initialize
    @input = $stdin.gets.chomp
    @position = 0
    @current_token = @input[@position]
    @token_text = ''
  end

  # Calls methods to determine token type and text
  def next_token
    token_type = -1
    # Checks for EOF condition
    if @current_token.nil? == false
      case @current_token
        # Checks for strings and while keyword
      when /[A-Za-z]/
        token_type = string_kwrd
          # Checks for integers and floats
      when /[-?0-9]/
        token_type = numbers
        # Checks comparisons
      when '=','<','>'
        token_type = comparisons(@current_token)

        # Checks other valid tokens
      when '(' , ')' , '{' , '}' , ';'
        token_type = special_characters(@current_token)
      else
        token_type = -99
        @token_text = @current_token
        continue
      end
    end
    token = MyToken.new(token_type, @token_text)
    return token
  end

  # Identifies tokens containing strings or the while keyword
  def string_kwrd
    @token_text = @current_token
    continue
    while @current_token =~ /[A-Za-z]/ do
      @token_text = @token_text + @current_token
      continue
    end
    if @token_text == 'while'
      return 0
    else
      return 1
    end
  end

  # Identifies tokens containing integer or float values
  def numbers
    @token_text = @current_token
    continue
    while @current_token =~ /[0-9]/ do
      @token_text = @token_text + @current_token
      continue
    end
    if @current_token == '.'
      @token_text = @token_text + @current_token
      continue
      while @current_token =~ /[0-9]/ do
        @token_text = @token_text + @current_token
        continue
      end
      return 3
    else
      return 2
    end
  end

  # Identifiers tokens for comparisons
  def comparisons(symbol)
    case symbol
    when '='
      continue
      if @current_token == '='
        @token_text = "=="
        continue
        return 4
      else
        @token_text = '='
        return -99
      end
    when '<'
      continue
      if @current_token == '='
        @token_text = '<='
        continue
        return 6
      else
        @token_text = '<'
        return 5
      end
    when '>'
      continue
      if @current_token == '='
        @token_text = '>='
        continue
        return 8
      else
        @token_text = '>'
        return 7
      end
    end
  end

  # Identifies valid special characters
  def special_characters(symbol)
    case symbol
    when '('
      @token_text = @current_token
      continue
      return 14
    when ')'
      @token_text = @current_token
      continue
      return 15
    when '{'
      @token_text = @current_token
      continue
      return 16
    when '}'
      @token_text = @current_token
      continue
      return 17
    when ';'
      @token_text = @current_token
      continue
      return 18
    end
  end

  # A method that simplifies iteration and ignores whitespace in the input
  def continue
    @position += 1
    @current_token = @input[@position]
    # Ignores whitespace
    if @current_token == ' '
      continue
    end
    if @current_token == '\\'
      @position += 2
      @current_token = @input[@position]
    end
  end
end