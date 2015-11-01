#Steps
1. Be sure Ruby's bundler is installed by running `bundle list` from the working copy.
    * If this command fails, you'll at least need to install Ruby and `bundler` system wide to use Test Kitchen.
1. Run `bundle install` to install gems locally.
1. Edit `.kitchen.yml`
       * Your default security group will need to allow ssh. Alternatively, uncomment and define the security group id property.
       * Add the name of your AWS ssh key to `aws_ssh_key_id`.
1. Run `bundle exec kitchen list` to see a list of instances.
1. Create an instance: `bundle exec kitchen create`.
1. Run Chef on the instance: `bundle exec kitchen converge`.
1. Run the integration test suites:`bundle exec kitchen verify`.
1. Tear down the instance: `bundle exec kitchen destroy`.

To run the full life cycle call `bundle exec kitchen test`.