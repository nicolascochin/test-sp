# frozen_string_literal: true

class MostPageViewsPrinter
  class << self
    def call(aggregator)
      puts 'Most page views:'
      if aggregator.nil?
        puts 'no data'
        return
      end
      print_sorted_data(aggregator)
    end

    private

    def print_sorted_data(aggregator)
      aggregator
        .sort_by { |_endpoint, ips| ips.count }
        .reverse_each
        .each { |endpoint, ips| puts "#{endpoint} #{ips.count} visits" }
    end
  end
end
