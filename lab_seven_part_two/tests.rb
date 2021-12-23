# frozen_string_literal: true

require_relative 'main'

require 'minitest/spec'
require 'minitest/autorun'
#проверяем иерархию
class ClassTest < MiniTest::Test
  def test_hierarchy
    int = Int.new(5)
    str_int = StrInt.new(5, 'abc')
    assert_equal str_int.class.superclass, int.class
  end
end
