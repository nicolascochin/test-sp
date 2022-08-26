# frozen_string_literal: true

require_relative '../abstract_test'
require_relative "#{APP_PATH}/row_entry_builder"
require_relative "#{APP_PATH}/row_entry"

class RowEntryBuilderTest < AbstractTest
  def setup
    @valid_input = 'an_endpoint an_ip'
  end

  def test_an_empty_string_returns_nil
    assert_nil RowEntryBuilder.call('')
  end

  def test_a_nil_entry_returns_nil
    assert_nil RowEntryBuilder.call(nil)
  end

  def test_an_invalid_string_returns_nil
    assert_nil RowEntryBuilder.call('invalid_input_ip_is_missing')
  end

  def test_a_valid_string_returns_a_row_entry
    assert_equal(
      RowEntry.new(endpoint: 'an_endpoint', ip: 'an_ip'),
      RowEntryBuilder.call(@valid_input)
    )
  end
end
