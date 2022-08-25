# Install
Install required dependencies with bundle: `bundle install`

# Tests
All tests can be run with the following command: `bundle exec rake test`

## Integration  test
An integration test has been setup in the beginning of the process in order to validate the final result. Once the test is green, the feature will be considered terminated

The expected output has been computed with the following commands:
* `awk '{print $1}' data/webserver.log | sort | uniq -c | sort -r`
* `for ENDPOINT in $(awk '{print $1}' data/webserver.log | sort -u); do echo "$(grep $ENDPOINT data/webserver.log| sort -u | wc -l) $ENDPOINT" ; done | sort -k 1nr`

The first one lists the endpoints with the most page views.
The second one lists the endpoints with the most unique page
