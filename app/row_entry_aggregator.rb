# frozen_string_literal: true

class RowEntryAggregator
  attr_reader :data

  def initialize
    @data = Hash.new { |hash, k| hash[k] = [] unless hash.key?(k) }
  end

  def add_row_entry(row_entry)
    return if row_entry.nil?

    @data[row_entry.endpoint] << row_entry.ip
  end
end
