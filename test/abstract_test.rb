# frozen_string_literal: true

require 'minitest/autorun'

ROOT_PATH = File.dirname(__dir__)
APP_PATH = "#{ROOT_PATH}/app".freeze
TEST_PATH = "#{ROOT_PATH}/test".freeze
FIXTURES_PATH = "#{TEST_PATH}/fixtures".freeze
EXPECTATIONS_PATH = "#{TEST_PATH}/expectations".freeze

AggregatorStub = Struct.new(:data)

class AbstractTest < Minitest::Test
end
