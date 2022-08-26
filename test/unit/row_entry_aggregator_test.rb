# frozen_string_literal: true

require_relative '../abstract_test'
require_relative "#{APP_PATH}/row_entry_aggregator"
require_relative "#{APP_PATH}/row_entry"

class RowEntryAggregatorTest < AbstractTest
  def setup
    @aggregator = RowEntryAggregator.new
    @row_entry = RowEntry.new(endpoint: 'an_endpoint', ip: 'an_ip')
  end

  def test_returns_an_empty_hash_when_no_entry_is_added
    assert_equal({}, @aggregator.data)
  end

  def test_a_nil_row_entry_is_added_is_skipped
    @aggregator.add_row_entry(nil)
    assert_equal({}, @aggregator.data)
  end

  def test_a_nil_row_entry_is_added_is_skipped_even_when_aggregator_is_not_empty
    @aggregator.add_row_entry(@row_entry)
    @aggregator.add_row_entry(nil)
    assert_equal(
      { 'an_endpoint' => ['an_ip'] },
      @aggregator.data
    )
  end

  def test_a_row_entry_is_added
    @aggregator.add_row_entry(@row_entry)
    assert_equal(
      { 'an_endpoint' => ['an_ip'] },
      @aggregator.data
    )
  end
end
