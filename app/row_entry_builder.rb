# frozen_string_literal: true

class RowEntryBuilder
  def self.call(raw_string)
    return nil if raw_string.nil? || raw_string.empty?

    raw_string
      .split
      .then do |row_array|
        row_array.size == 2 ? RowEntry.new(endpoint: row_array[0], ip: row_array[1]) : nil
      end
  end
end
