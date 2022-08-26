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

  def test_two_rows_entries_are_added_on_same_endpoint_with_same_ip
    @aggregator.add_row_entry(@row_entry)
    @aggregator.add_row_entry(@row_entry)
    assert_equal(
      { 'an_endpoint' => %w[an_ip an_ip] },
      @aggregator.data
    )
  end

  def test_two_rows_entries_are_added_on_same_endpoint_with_different_ip
    @aggregator.add_row_entry(@row_entry)
    @aggregator.add_row_entry(RowEntry.new(endpoint: @row_entry.endpoint, ip: 'another_ip'))
    assert_equal(
      { 'an_endpoint' => %w[an_ip another_ip] },
      @aggregator.data
    )
  end

  def test_two_different_rows_entries_are_added
    @aggregator.add_row_entry(@row_entry)
    @aggregator.add_row_entry(RowEntry.new(endpoint: 'another_endpoint', ip: 'another_ip'))
    assert_equal(
      {
        'an_endpoint' => %w[an_ip],
        'another_endpoint' => %w[another_ip]
      },
      @aggregator.data
    )
  end

  def test_three_different_rows_entries_are_added
    @aggregator.add_row_entry(@row_entry)
    @aggregator.add_row_entry(RowEntry.new(endpoint: @row_entry.endpoint, ip: 'foo_ip'))
    @aggregator.add_row_entry(RowEntry.new(endpoint: 'another_endpoint', ip: 'another_ip'))
    assert_equal(
      {
        'an_endpoint' => %w[an_ip foo_ip],
        'another_endpoint' => %w[another_ip]
      },
      @aggregator.data
    )
  end
end
