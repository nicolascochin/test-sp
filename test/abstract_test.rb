require 'minitest/autorun'

ROOT_PATH=File.dirname(__dir__)
APP_PATH="#{ROOT_PATH}/app"
TEST_PATH="#{ROOT_PATH}/test"

class AbstractTest < Minitest::Test
end
