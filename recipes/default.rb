include_recipe 'sentry_example::postgresql'
include_recipe 'sentry_example::redis'
include_recipe 'sentry_example::nginx'
include_recipe 'sentry_example::sentry'

%w[git htop tree wget].each do |library|
  package library do
    action :install
  end
end