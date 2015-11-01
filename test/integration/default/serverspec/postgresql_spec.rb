require 'serverspec'

set :backend, :exec

%w[ postgresql8.x86_64 postgresql8-server.x86_64 ].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe service('postgresql') do
  it { should be_enabled }
  it { should be_running }
end

describe port(5432) do
  it { should be_listening }
end
