# Install
Install required dependencies with bundle: `bundle install`

# Script
A script `parse` is available inside the bin directory. It is executed like this `parse XXX` where XXX is a file to parse.
The script will return the following error codes:
  * 1 if the filename is missing
  * 2 is the file does not exists
  * 3 if the file is not a file

# Rubocop
Rubocop is installed. Run `bundle exec rubocop` to run an analysis
# Tests
All tests can be run with the following command: `bundle exec rake test`
A single test can be run with the following command: `ruby XXX` where XXX represents the file to test. If needed a specific test can be executed with the following command : `ruby XXX --name YYY` where YYY is the name of the test

## Integration  test
An integration test has been setup in the beginning of the process in order to validate the final result. Once the test is green, the feature will be considered terminated

The expected output has been computed with the following commands:
* `awk '{print $1}' data/webserver.log | sort | uniq -c | sort -r` to list the endpoints with the most page views.
* `for ENDPOINT in $(awk '{print $1}' data/webserver.log | sort -u); do echo "$(grep "$ENDPOINT "  data/webserver.log| sort -u | wc -l) $ENDPOINT" ; done | sort -k 1nr` to the endpoints with the most unique page

In this test the integration test is setup in the firsts PRs. This is OK here because it is a small project with no CI. In a real case, the development would have been packaged into one PR (very few files). But the behaviour is the same : one (or many) test(s) to validate the expected result/behaviour. Both integration and unit tests are wroten in order to avoid any mistake (thanks to the integration test I found some issues)

# Personal opinion about the test
In real life, I would have setup a CI. Rubocop and the tests would have been run in it. Husky might have been also use to run rubocop before each commit (to avoid a maximum failure in the CI).

Also in real life, application files would have been organized indifferent folders such as models, services ...

I used minitest with no exernal libraries (because it is a small project and I wanted to go fast). In a real project, I think I would use several mibraries, such as `mocha` (to stub and mock in a better way). In this project, I did this. `AggregatorStub = Struct.new(:data)` Obviously I won't do this in a real project. Once again, I did this to go quickly and it is acceptable (I guess), as the project is really small and has no intention to evolve.

As I said above, in a real application I would never have commited a failed test on master (integration test wrote in the beginning). This is something I only do in technical tests. I also used PRs for each evolution as it is the way I work.

At last, my code could fail with a very large log file as I store all IPs in the aggregator. I did this way, as it is simpler, quicker and easier to read. In case of very large files, we could change the aggregator to store a hash (or a Struct) as a value. The hash would be composed of 2 keys : number_total_of_ips and number_of_unique_views.
