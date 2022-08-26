# frozen_string_literal: true

require_relative '../abstract_test'
require_relative "#{APP_PATH}/unique_views_printer"

class UniqueViewsPrinterTest < AbstractTest
  def test_a_nil_entry_does_not_print_any_result
    expected = <<~NO_RESULT
      Unique views:
      no data
    NO_RESULT
    capture_output(nil, expected)
  end

  def test_print_endpoints_with_unique_views_count_sorted_desc # rubocop:disable Metrics/MethodLength
    aggregator = {
      'dummy_endpoint' => ['third_ip'],
      'another_endpoint' => %w[first_ip second_ip second_ip second_ip],
      'an_endpoint' => %w[first_ip second_ip first_ip third_ip]
    }

    expected = <<~NO_RESULT
      Unique views:
      an_endpoint 3 unique views
      another_endpoint 2 unique views
      dummy_endpoint 1 unique views
    NO_RESULT

    capture_output(aggregator, expected)
  end

  private

  def capture_output(data, expected, error = '')
    out, err = capture_io { UniqueViewsPrinter.call(data) }
    assert_equal expected, out
    assert_equal error, err
  end
end
