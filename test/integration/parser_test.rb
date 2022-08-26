# frozen_string_literal: true

require_relative '../abstract_test'
require_relative "#{APP_PATH}/parser"

class ParserTest < AbstractTest
  def test_renders_the_expected_output
    foo = Parser.new(File.join(FIXTURES_PATH, 'webserver.log'))
    expected = File.read(File.join(EXPECTATIONS_PATH, 'webserver_result.txt'))
    out, err = capture_io { foo.call }
    assert_equal expected, out
    assert_equal '', err
  end
end
