# frozen_string_literal: true

require_relative '../abstract_test'
require_relative "#{APP_PATH}/row_entry_builder"
require_relative "#{APP_PATH}/row_entry"

class RowEntryBuilderTest < AbstractTest
  def setup
    @valid_input = 'an_endpoint an_ip'
    @invalid_input = 'invalid_input_ip_is_missing'
  end

  def test_an_empty_string_returns_nil
    assert_nil RowEntryBuilder.call('')
  end

  def test_a_nil_entry_returns_nil
    assert_nil RowEntryBuilder.call(nil)
  end

  def test_an_invalid_string_returns_nil
    assert_nil RowEntryBuilder.call(@invalid_input)
  end

  def test_an_invalid_string_writes_a_warning
    out, err = capture_io { RowEntryBuilder.call(@invalid_input) }
    assert_empty out
    assert_equal 'Invalid entry, skipping the row', err.chomp
  end

  def test_a_valid_string_returns_a_row_entry
    assert_equal(
      RowEntry.new(endpoint: 'an_endpoint', ip: 'an_ip'),
      RowEntryBuilder.call(@valid_input)
    )
  end
end
