# Install
Install required dependencies with bundle: `bundle install`


# Rubocop
Rubocop is installed. Run `bundle exec rubocop` to run an analysis
# Tests
All tests can be run with the following command: `bundle exec rake test`

## Integration  test
An integration test has been setup in the beginning of the process in order to validate the final result. Once the test is green, the feature will be considered terminated

The expected output has been computed with the following commands:
* `awk '{print $1}' data/webserver.log | sort | uniq -c | sort -r` to list the endpoints with the most page views.
* `for ENDPOINT in $(awk '{print $1}' data/webserver.log | sort -u); do echo "$(grep $ENDPOINT data/webserver.log| sort -u | wc -l) $ENDPOINT" ; done | sort -k 1nr` to the endpoints with the most unique page

In this test the integration test is setup in the firsts PRs. This is OK here because it is a small project with no CI. In a real case, the development would have been packaged into one PR (very few files). But the behaviour is the same : one (or many) test(s) to validate the expected result/behaviour
