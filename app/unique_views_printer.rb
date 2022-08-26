# frozen_string_literal: true

require 'set'

class UniqueViewsPrinter
  class << self
    def call(aggregator)
      puts 'Unique views:'
      if aggregator.nil? || aggregator.data.empty?
        puts 'no data'
        return
      end
      print_sorted_data(aggregator.data)
    end

    private

    def print_sorted_data(aggregator)
      aggregator
        .transform_values { |ips| Set.new(ips).count }
        .sort_by { |_endpoint, unique_views| unique_views }
        .reverse_each
        .each { |endpoint, unique_views| puts "#{endpoint} #{unique_views} unique views" }
    end
  end
end
