# Copyright (C) 2011 American Registry for Internet Numbers

require 'test/unit'
require 'logger'
require 'stringio'

# Tests the logger
class LoggerTest < Test::Unit::TestCase

  def test_unknown_data_amount
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.data_amount = ARINr::DataAmount::FOO
    assert_raise( ArgumentError ) { logger.terse( "Network Handle", "NET-192-136-136-0-1" ) }
  end

  def test_log_extra_at_default
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.extra( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "", logger.data_out.string )
  end

  def test_log_extra_at_normal
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.data_amount = ARINr::DataAmount::NORMAL_DATA
    logger.extra( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "", logger.data_out.string )
  end

  def test_log_extra_at_terse
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.data_amount = ARINr::DataAmount::TERSE_DATA
    logger.extra( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "", logger.data_out.string )
  end

  def test_log_extra_at_extra
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.data_amount = ARINr::DataAmount::EXTRA_DATA
    logger.extra( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "           Network Handle:  NET-192-136-136-0-1\n", logger.data_out.string )
  end

  def test_log_terse_at_default
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.terse( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "           Network Handle:  NET-192-136-136-0-1\n", logger.data_out.string )
  end

  def test_log_terse_at_normal
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.data_amount = ARINr::DataAmount::NORMAL_DATA
    logger.terse( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "           Network Handle:  NET-192-136-136-0-1\n", logger.data_out.string )
  end

  def test_log_terse_at_terse
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.data_amount = ARINr::DataAmount::TERSE_DATA
    logger.terse( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "           Network Handle:  NET-192-136-136-0-1\n", logger.data_out.string )
  end

  def test_log_terse_at_extra
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.data_amount = ARINr::DataAmount::EXTRA_DATA
    logger.terse( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "           Network Handle:  NET-192-136-136-0-1\n", logger.data_out.string )
  end

  def test_log_normal_at_default
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.datum( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "           Network Handle:  NET-192-136-136-0-1\n", logger.data_out.string )
  end

  def test_log_normal_at_normal
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.data_amount = ARINr::DataAmount::NORMAL_DATA
    logger.datum( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "           Network Handle:  NET-192-136-136-0-1\n", logger.data_out.string )
  end

  def test_log_normal_at_terse
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.data_amount = ARINr::DataAmount::TERSE_DATA
    logger.datum( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "", logger.data_out.string )
  end

  def test_log_normal_at_extra
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.data_amount = ARINr::DataAmount::EXTRA_DATA
    logger.datum( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "           Network Handle:  NET-192-136-136-0-1\n", logger.data_out.string )
  end

  def test_unknown_message_level
    logger = ARINr::Logger.new
    logger.message_out = StringIO.new
    logger.message_level = ARINr::MessageLevel::NO_SUCH_LEVEL
    assert_raise( ArgumentError ) { logger.mesg( "Network Handle" ) }
  end

  def test_log_some_at_default
    logger = ARINr::Logger.new
    logger.message_out = StringIO.new
    logger.mesg( "blah" )
    assert_equal( "# blah\n", logger.message_out.string )
  end

  def test_log_some_at_some
    logger = ARINr::Logger.new
    logger.message_out = StringIO.new
    logger.message_level = ARINr::MessageLevel::SOME_MESSAGES
    logger.mesg( "blah" )
    assert_equal( "# blah\n", logger.message_out.string )
  end

  def test_log_some_at_trace
    logger = ARINr::Logger.new
    logger.message_out = StringIO.new
    logger.message_level = ARINr::MessageLevel::ALL_MESSAGES
    logger.mesg( "blah" )
    assert_equal( "# blah\n", logger.message_out.string )
  end

  def test_log_some_at_none
    logger = ARINr::Logger.new
    logger.message_out = StringIO.new
    logger.message_level = ARINr::MessageLevel::NO_MESSAGES
    logger.mesg( "blah" )
    assert_equal( "", logger.message_out.string )
  end

  def test_log_trace_at_default
    logger = ARINr::Logger.new
    logger.message_out = StringIO.new
    logger.trace( "blah" )
    assert_equal( "", logger.message_out.string )
  end

  def test_log_trace_at_some
    logger = ARINr::Logger.new
    logger.message_out = StringIO.new
    logger.message_level = ARINr::MessageLevel::SOME_MESSAGES
    logger.trace( "blah" )
    assert_equal( "", logger.message_out.string )
  end

  def test_log_trace_at_trace
    logger = ARINr::Logger.new
    logger.message_out = StringIO.new
    logger.message_level = ARINr::MessageLevel::ALL_MESSAGES
    logger.trace( "blah" )
    assert_equal( "## blah\n", logger.message_out.string )
  end

  def test_log_trace_at_none
    logger = ARINr::Logger.new
    logger.message_out = StringIO.new
    logger.message_level = ARINr::MessageLevel::NO_MESSAGES
    logger.trace( "blah" )
    assert_equal( "", logger.message_out.string )
  end

  def test_messages_and_data
    logger = ARINr::Logger.new
    logger.message_out = StringIO.new
    logger.data_out = logger.message_out
    logger.mesg( "blah" )
    assert_equal( "# blah\n", logger.message_out.string )
    logger.datum( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "# blah\n           Network Handle:  NET-192-136-136-0-1\n", logger.data_out.string )
  end

  def test_messages_vs_data
    logger = ARINr::Logger.new
    messages = StringIO.new
    logger.message_out = messages
    data = StringIO.new
    logger.data_out = data
    logger.mesg( "blah" )
    assert_equal( "# blah\n", messages.string )
    logger.datum( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "           Network Handle:  NET-192-136-136-0-1\n", data.string )
  end

  def test_log_ljust_item_name
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.data_amount = ARINr::DataAmount::NORMAL_DATA
    logger.item_name_rjust = false
    logger.datum( "Network Handle", "NET-192-136-136-0-1" )
    assert_equal( "Network Handle           :  NET-192-136-136-0-1\n", logger.data_out.string )
  end

  def test_log_empty_datum
    logger = ARINr::Logger.new
    logger.data_out = StringIO.new
    logger.data_amount = ARINr::DataAmount::NORMAL_DATA
    logger.datum( "Network Handle", "" )
    assert_equal( "", logger.data_out.string )
  end

end
