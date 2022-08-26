# frozen_string_literal: true

require_relative 'row_entry_builder'
require_relative 'row_entry_aggregator'
require_relative 'most_page_views_printer'
require_relative 'unique_views_printer'

class Parser
  attr_reader :filename, :data_aggregator

  def initialize(filename)
    @filename = filename
    @data_aggregator = RowEntryAggregator.new
  end

  def call
    File.new(filename).each do |row|
      row_entry = RowEntryBuilder.call(row)
      data_aggregator.add_row_entry(row_entry)
    end
    MostPageViewsPrinter.call(data_aggregator)
    puts ''
    UniqueViewsPrinter.call(data_aggregator)
  end
end
