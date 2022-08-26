# frozen_string_literal: true

require_relative '../abstract_test'
require_relative "#{APP_PATH}/unique_views_printer"

class UniqueViewsPrinterTest < AbstractTest
  def test_a_nil_entry_does_not_print_any_result
    expected = <<~NO_RESULT
      Unique views:
      no data
    NO_RESULT
    out, err = capture_io { UniqueViewsPrinter.call(nil) }
    assert_equal expected, out
    assert_equal '', err
  end
end
