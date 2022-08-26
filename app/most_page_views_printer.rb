# frozen_string_literal: true

class MostPageViewsPrinter
  class << self
    def call(aggregator)
      puts 'Most page views:'
      if aggregator.nil? || aggregator.data.empty?
        puts 'no data'
        return
      end
      print_sorted_data(aggregator.data)
    end

    private

    def print_sorted_data(data)
      data
        .sort_by { |_endpoint, ips| ips.count }
        .reverse_each
        .each { |endpoint, ips| puts "#{endpoint} #{ips.count} visits" }
    end
  end
end
