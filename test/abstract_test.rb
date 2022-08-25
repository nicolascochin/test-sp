require 'minitest/autorun'

ROOT_PATH=File.dirname(__dir__)
APP_PATH="#{ROOT_PATH}/app"
TEST_PATH="#{ROOT_PATH}/test"
FIXTURES_PATH="#{TEST_PATH}/fixtures"
EXPECTATIONS_PATH="#{TEST_PATH}/expectations"

class AbstractTest < Minitest::Test
end
