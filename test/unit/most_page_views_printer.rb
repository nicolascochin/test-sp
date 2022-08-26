# frozen_string_literal: true

require_relative '../abstract_test'
require_relative "#{APP_PATH}/most_page_views_printer"

class MostPageViewsPrinterTest < AbstractTest
  def test_a_nil_entry_does_not_print_any_result
    expected = <<~NO_RESULT
      Most page views:
      no data
    NO_RESULT
    out, err = capture_io { MostPageViewsPrinter.call(nil) }
    assert_equal expected, out
    assert_equal '', err
  end
end
