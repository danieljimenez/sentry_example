include_recipe 'database::postgresql'

virtualenv_path = '/www/sentry'
sentry_config_path = '/www/sentry/sentry.conf.py'

packages = []
packages += %w[python python-devel]
packages += %w[openssl-devel libxslt-devel libxml2-devel libffi-devel libpqxx-devel]

packages.each do |library|
  package library do
    action :install
  end
end

directory '/www'
python_runtime '2'
python_virtualenv virtualenv_path

python_package 'sentry' do
  virtualenv virtualenv_path
end

postgresql_database 'sentry' do
  connection(
      :host      => '127.0.0.1',
      :port      => 5432,
      :username  => 'postgres',
      :password  => node['postgresql']['password']['postgres']
  )
  action :create
end

# TODO: create sentry configuration file w/url, email, redis, postgresql

# TODO: call sentry upgrade