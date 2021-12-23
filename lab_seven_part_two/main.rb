# frozen_string_literal: true

class Int
  attr_reader :int, :int_length

  def initialize(int)
    @int = int
    @int_length = @int.to_s.length
  end
end

class StrInt < Int
  attr_reader :str, :str_length

  def initialize(int, str)
    super(int)
    @str = str
    @str_length = @str.length
  end
end

def input
  puts 'Введите число: '
  number = gets.chomp
  puts 'Введите строку: '
  string = gets.chomp

  StrInt.new(number, string)
end
