# Copyright (C) 2011 American Registry for Internet Numbers

require 'test/unit'
require 'enum'

class EnumTest < Test::Unit::TestCase

  class Color < ARINr::Enum

    Color.add_item :BLUE, 1
    Color.add_item :RED, 2
    Color.add_item :YELLOW, 3

  end

  class Level < ARINr::Enum

    Level.add_item :HIGH, "HIGH"
    Level.add_item :LOW, "LOW"
    Level.add_item :INBETWEEN, "INBETWEEN"

  end

  def test_color_red

    my_color = Color::RED
    assert_equal( 2, my_color )

  end

  def test_color_green

    my_color = Color::GREEN
    assert_nil( my_color )

  end

  def test_color_each

    a = []
    Color.each { |key,value|
      a << value
    }
    assert_equal( true, a.include?( 1 ) )
    assert_equal( true, a.include?( 2 ) )
    assert_equal( true, a.include?( 3 ) )

  end

  def test_level_high

    my_level = Level::HIGH
    assert_equal( "HIGH", my_level )

  end

  def test_level_bottom

    my_level = Level::BOTTOM
    assert_nil( my_level )

  end

  def test_level_each

    a = []
    Level.each { |key,value|
      a << value
    }
    assert_equal( true, a.include?( "HIGH" ) )
    assert_equal( true, a.include?( "LOW" ) )
    assert_equal( true, a.include?( "INBETWEEN" ) )

  end

end