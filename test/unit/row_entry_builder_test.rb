# frozen_string_literal: true

require_relative '../abstract_test'
require_relative "#{APP_PATH}/row_entry_builder"

class RowEntryBuilderTest < AbstractTest
  def test_an_empty_string_returns_nil
    assert_nil RowEntryBuilder.call('')
  end

  def test_a_nil_entry_returns_nil
    assert_nil RowEntryBuilder.call(nil)
  end
end
