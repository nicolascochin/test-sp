# frozen_string_literal: true

require_relative '../abstract_test'
require_relative "#{APP_PATH}/most_page_views_printer"

class MostPageViewsPrinterTest < AbstractTest
  def test_a_nil_entry_does_not_print_any_result
    expected = <<~NO_RESULT
      Most page views:
      no data
    NO_RESULT
    capture_output(nil, expected)
  end

  def test_print_most_visited_endpoint_sorted_desc # rubocop:disable Metrics/MethodLength
    aggregator = {
      'an_endpoint' => %w[first_ip second_ip],
      'another_endpoint' => %w[first_ip second_ip third_ip],
      'dummy_endpoint' => ['third_ip'],
      'last_endpoint' => %w[third_ip second_ip second_ip first_ip]
    }

    expected = <<~NO_RESULT
      Most page views:
      last_endpoint 4 visits
      another_endpoint 3 visits
      an_endpoint 2 visits
      dummy_endpoint 1 visits
    NO_RESULT

    capture_output(aggregator, expected)
  end

  private

  def capture_output(data, expected, error = '')
    out, err = capture_io { MostPageViewsPrinter.call(data) }
    assert_equal expected, out
    assert_equal error, err
  end
end
