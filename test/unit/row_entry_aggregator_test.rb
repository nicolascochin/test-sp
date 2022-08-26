# frozen_string_literal: true

require_relative '../abstract_test'
require_relative "#{APP_PATH}/row_entry_aggregator"

class RowEntryAggregatorTest < AbstractTest
  def setup
    @aggregator = RowEntryAggregator.new
  end

  def test_returns_an_empty_hash_when_no_entry_is_added
    assert_equal({}, @aggregator.data)
  end
end
