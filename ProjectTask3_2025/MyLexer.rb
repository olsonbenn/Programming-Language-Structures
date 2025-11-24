# MyLexer.rb
# Authors: Logan Bratonja and Bennett Olson
require_relative "MyToken"
class MyLexer

  def initialize
    @input = $stdin.gets.chomp
    @position = 0
    @current_token = @input[@position]
  end

  def next_token
    token_type = -1
    token_text = ''
    # Checks for EOF condition
    if @current_token.nil? == false
      case @current_token

        # Checks for strings and while keyword
      when /[A-Za-z]/
          token_text = @current_token
          continue
          while @current_token =~ /[A-Za-z]/ do
            token_text = token_text + @current_token
            continue
          end
          if token_text == 'while'
            token_type = 0
          else
            token_type = 1
          end

          # Checks for integers and floats
      when /[-?0-9]/
        token_text = @current_token
        continue
        while @current_token =~ /[0-9]/ do
          token_text = token_text + @current_token
          continue
        end
        if @current_token == '.'
          token_text = token_text + @current_token
          continue
          while @current_token =~ /[0-9]/ do
            token_text = token_text + @current_token
            continue
          end
          token_type = 3
        else
          token_type = 2
        end

        # Checks comparisons
      when '='
        continue
        if @current_token == '='
          token_type = 4
          token_text = "=="
          continue
        else
          token_type = -99
          token_text = '='
        end


      when '<'
        continue
        if @current_token == '='
          token_type = 6
          token_text = '<='
          continue
        else
          token_type = 5
          token_text = '<'
        end


      when '>'
        continue
        if @current_token == '='
          token_type = 8
          token_text = '>='
          continue
        else
          token_type = 7
          token_text = '>'
        end

        # Checks other valid tokens
      when '('
        token_type = 14
        token_text = @current_token
        continue
      when ')'
        token_type = 15
        token_text = @current_token
        continue
      when '{'
        token_type = 16
        token_text = @current_token
        continue
      when '}'
        token_type = 17
        token_text = @current_token
        continue
      when ';'
        token_type = 18
        token_text = @current_token
        continue

      else
        token_type = -99
        token_text = @current_token
        continue
      end
    end
    token = MyToken.new(token_type, token_text)
    return token
  end

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